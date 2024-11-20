import 'dart:async';

import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../components/bottom_sheets/bottomsheets.dart';
import '../../../../components/bottom_sheets/types.dart';
import '../../../../data/models/phone/phone_model.dart';
import '../../../../data/providers/repositories/auth/auth_repository.dart';
import '../../../../routes/app_pages.dart';

class PhoneVerificationController extends GetxController {
  late PhoneModel phone;

  final AuthRepository _authRepository = AuthRepository();

  final MainController mainController = Get.find();
  final RxString timeLeft = '02:00'.obs; // Tiempo restante en formato MM:SS
  final RxBool isCountdownComplete =
      false.obs; // Indica si el tiempo ha llegado a 0
  final RxBool isEmailVerified = false.obs;
  final RxnString userEmail = RxnString();

  Timer? _countdownTimer; // Timer para la cuenta regresiva
  Timer? _verificationTimer; // Timer para verificar el estado de email

  /// Inicia la cuenta regresiva de verificación
  void startCountdown() {
    _countdownTimer?.cancel(); // Cancela cualquier timer existente
    const int initialTime = 120; // Tiempo inicial en segundos (2 minutos)
    int countdownTime = initialTime;

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdownTime > 0) {
        countdownTime--;
        final minutes = countdownTime ~/ 60;
        final seconds = countdownTime % 60;
        timeLeft.value =
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      } else {
        timer.cancel();
        timeLeft.value = '00:00';
        isCountdownComplete.value = true;
      }
    });
  }

  /// Inicia la verificación periódica del estado del correo electrónico
  void startEmailVerificationCheck() {
    _verificationTimer?.cancel(); // Cancela cualquier timer existente

    _verificationTimer =
        Timer.periodic(const Duration(seconds: 3), (timer) async {
      try {
        final user =
            _authRepository.getCurrentUser(); // Obtener el usuario actual
        if (user != null) {
          await user.reload(); // Recarga los datos del usuario
          if (user.emailVerified) {
            isEmailVerified.value = true;
            timer.cancel();
            navigateToHome();
          }
        }
      } catch (e) {
        timer.cancel(); // Cancela el timer si ocurre un error
        rethrow;
      }
    });
  }

  /// Navega a la pantalla principal
  void navigateToHome() {
    Get.offNamedUntil(
      Routes.HOME,
      (route) => route.settings.name == Routes.HOME,
    );
  }

  @override
  void onInit() {
    super.onInit();
    phone = Get.arguments as PhoneModel;

    startCountdown(); // Inicia la cuenta regresiva al iniciar el controlador
  }

  @override
  void onReady() async {
    super.onReady();
    // userEmail.value = await _authRepository.getUserEmail();
    // await _authRepository
    //     .sendEmailVerification(); // Envía el correo de verificación
    // startEmailVerificationCheck(); // Comienza a escuchar la verificación del email
  }

  /// Desconectar al usuario
  Future<void> signOut() async {
    Bottomsheets.staticBottomSheet(BottomSheetTypes.authSignOut);
  }

  /// Reintentar el proceso de verificación
  void tryAgain() {
    isCountdownComplete.value = false;
    timeLeft.value = '02:00';
    startCountdown(); // Reinicia la cuenta regresiva
    _authRepository
        .sendEmailVerification(); // Reenvía el correo de verificación
    startEmailVerificationCheck(); // Reinicia la verificación
  }

  @override
  void onClose() {
    _countdownTimer?.cancel(); // Cancela el temporizador de cuenta regresiva
    _verificationTimer?.cancel(); // Cancela el temporizador de verificación
    super.onClose();
  }
}
