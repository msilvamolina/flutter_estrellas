import 'dart:async';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/providers/repositories/auth/auth_repository.dart';

class EmailVerificationController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  MainController mainController = Get.find();

  RxString timeLeft = '02:00'.obs; // Tiempo restante en formato MM:SS
  RxBool isCountdownComplete = false.obs; // Indica si el tiempo ha llegado a 0
  Timer? _timer; // Almacena el timer para cancelarlo si es necesario

  void startCountdown() {
    // Cancelamos cualquier timer existente antes de iniciar uno nuevo
    _timer?.cancel();
    int countdownTime = 120; // Tiempo inicial en segundos (2 minutos)

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdownTime > 0) {
        countdownTime--;
        int minutes = countdownTime ~/ 60;
        int seconds = countdownTime % 60;
        timeLeft.value =
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      } else {
        // Detenemos el timer y actualizamos la variable de completado
        timer.cancel();
        timeLeft.value = '00:00';
        isCountdownComplete.value = true;
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    startCountdown(); // Inicia la cuenta regresiva al inicializar el controlador
  }

  void tryAgain() {
    isCountdownComplete.value = false;
    timeLeft.value = '02:00';
    startCountdown(); // Reinicia la cuenta regresiva
  }

  @override
  void onClose() {
    _timer?.cancel(); // Cancela el timer cuando se cierra el controlador
    super.onClose();
  }
}
