import 'dart:async';
import 'package:get/get.dart';
import '../../../../app/controllers/main_controller.dart';
import '../../../../data/providers/repositories/auth/auth_repository.dart';
import '../../../../routes/app_pages.dart';

class EmailVerificationController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  MainController mainController = Get.find();

  RxString timeLeft = '02:00'.obs; // Tiempo restante en formato MM:SS
  RxBool isCountdownComplete = false.obs; // Indica si el tiempo ha llegado a 0
  Timer? _timer; // Timer para la cuenta regresiva
  Timer? _verificationTimer; // Timer para verificar el estado de email
  RxBool isEmailVerified = false.obs;

  void startCountdown() {
    _timer?.cancel(); // Cancelar cualquier timer existente
    int countdownTime = 120; // Tiempo inicial en segundos (2 minutos)

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdownTime > 0) {
        countdownTime--;
        int minutes = countdownTime ~/ 60;
        int seconds = countdownTime % 60;
        timeLeft.value =
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      } else {
        timer.cancel();
        timeLeft.value = '00:00';
        isCountdownComplete.value = true;
      }
    });
  }

  void startEmailVerificationCheck() {
    _verificationTimer?.cancel(); // Cancelar cualquier timer existente

    _verificationTimer = Timer.periodic(Duration(seconds: 3), (timer) async {
      final user =
          _authRepository.getCurrentUser(); // Obtener el usuario actual
      if (user != null) {
        await user.reload(); // Recargar los datos del usuario
        if (user.emailVerified) {
          isEmailVerified.value = true;
          timer.cancel();
          navigateToHome();
        }
      }
    });
  }

  void navigateToHome() {
    Get.offNamedUntil(
      Routes.HOME,
      (route) =>
          route.settings.name ==
          Routes.HOME, // Cambia Routes.HOME por la ruta que deseas mantener.
    );
  }

  @override
  void onInit() {
    super.onInit();
    startCountdown(); // Inicia la cuenta regresiva
  }

  @override
  void onReady() {
    super.onReady();
    _authRepository.sendEmailVerification(); // Envía el correo de verificación
    startEmailVerificationCheck(); // Comienza a escuchar la verificación del email
  }

  void tryAgain() {
    isCountdownComplete.value = false;
    timeLeft.value = '02:00';
    startCountdown(); // Reinicia la cuenta regresiva
    _authRepository.sendEmailVerification();
    startEmailVerificationCheck(); // Reinicia la verificación
  }

  @override
  void onClose() {
    _timer?.cancel(); // Cancela el timer de cuenta regresiva
    _verificationTimer?.cancel(); // Cancela el timer de verificación
    super.onClose();
  }
}
