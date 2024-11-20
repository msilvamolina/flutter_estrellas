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
  final RxString timeLeft = '02:00'.obs;
  final RxBool isCountdownComplete = false.obs;
  final RxBool isEmailVerified = false.obs;
  final RxnString userEmail = RxnString();

  Timer? _countdownTimer;
  Timer? _verificationTimer;

  void startCountdown() {
    _countdownTimer?.cancel();
    const int initialTime = 120;
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

  void startEmailVerificationCheck() {
    _verificationTimer?.cancel();

    _verificationTimer =
        Timer.periodic(const Duration(seconds: 3), (timer) async {
      try {
        final user = _authRepository.getCurrentUser();
        if (user != null) {
          await user.reload();
          if (user.emailVerified) {
            isEmailVerified.value = true;
            timer.cancel();
            navigateToHome();
          }
        }
      } catch (e) {
        timer.cancel();
        rethrow;
      }
    });
  }

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

    startCountdown();
  }

  @override
  void onReady() async {
    super.onReady();

    await _authRepository.sendPhoneOTP(phone);
  }

  Future<void> signOut() async {
    Bottomsheets.staticBottomSheet(BottomSheetTypes.authSignOut);
  }

  void tryAgain() {
    isCountdownComplete.value = false;
    timeLeft.value = '02:00';
    startCountdown();
    _authRepository.sendEmailVerification();
    startEmailVerificationCheck();
  }

  @override
  void onClose() {
    _countdownTimer?.cancel();
    _verificationTimer?.cancel();
    super.onClose();
  }
}
