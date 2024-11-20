import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/modules/auth/email_verification/widgets/custom_pin_input_code.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../components/bottom_sheets/bottomsheets.dart';
import '../../../../components/bottom_sheets/types.dart';
import '../../../../components/snackbars/snackbars.dart';
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

  late TextEditingController pinController;

  String? _correctCode;
  String? get correctCode => _correctCode;
  String? _verificationId;

  String? _userCode;
  String? get userCode => _userCode;

  bool _isButtonLoading = false;
  bool get isButtonLoading => _isButtonLoading;

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

  void onCodeChanged(String? value) {
    _userCode = value;
    update(['button']);
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
    pinController = TextEditingController();
    phone = Get.arguments as PhoneModel;

    startCountdown();
  }

  @override
  void onReady() async {
    super.onReady();

    await firebaseVerification();
  }

  Future<void> firebaseVerification() async {
    String userPhone = '+${phone.countryCode!}${phone.number}';

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: userPhone,
      verificationCompleted: (PhoneAuthCredential credential) {
        pinController.text = credential.smsCode ?? '';
        _correctCode = credential.smsCode;
        update(['phone']);
      },
      verificationFailed: (FirebaseAuthException e) {
        Snackbars.error(e.toString());
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> startVerification() async {
    if (_verificationId == null) {
      return;
    }
    if (userCode == null) {
      return;
    }
    _isButtonLoading = true;
    update(['button']);
    Either<String, Unit> response = await _authRepository.verifyPhoneNumber(
        verificationId: _verificationId!, smsCode: userCode!);

    response.fold((failure) {
      pinController.text = '';
      _isButtonLoading = false;
      update(['button', 'phone']);

      Snackbars.error(failure);
    }, (_) async {
      Get.back(result: 'OK');
    });
  }

  Future<bool> onUserBack() async {
    Bottomsheets.staticBottomSheet(BottomSheetTypes.verifyPhoneBack);
    return false;
  }

  Future<void> tryAgain() async {
    isCountdownComplete.value = false;
    timeLeft.value = '02:00';
    startCountdown();
    await firebaseVerification();
  }

  @override
  void onClose() {
    _countdownTimer?.cancel();
    _verificationTimer?.cancel();
    pinController.dispose();
    super.onClose();
  }
}
