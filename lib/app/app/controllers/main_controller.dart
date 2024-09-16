import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/dialogs/register/register_dialog.dart';
import 'package:flutter_estrellas/app/app/dialogs/register_basic_data/register_basic_data_dialog.dart';
import 'package:flutter_estrellas/app/components/dialogs/confetti_dialog.dart';
import 'package:flutter_estrellas/app/components/dialogs/loader_dialog.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/auth/user_repository.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:get/get.dart';

import '../dialogs/login/login_dialog.dart';

class MainController extends GetxController {
  UserRepository userRepository = UserRepository();
  bool _withVolume = false;
  bool get withVolume => _withVolume;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void openLoginDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return LoginDialog();
      },
    );
  }

  void openRegisterDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return RegisterDialog();
      },
    );
  }

  void openRegisterBasicDataDialog() {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return RegisterBasicDataDialog();
      },
    );
  }

  void changeVolume() {
    _withVolume = !_withVolume;
    update();
  }

  void showLoader({String? title, String? message}) {
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (BuildContext context) {
        return LoaderDialog(title: title, message: message);
      },
    );
  }
}
