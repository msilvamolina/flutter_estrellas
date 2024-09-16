import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:get/get.dart';

import '../dialogs/login/login_dialog.dart';

class MainController extends GetxController {
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

  void changeVolume() {
    _withVolume = !_withVolume;
    update();
  }
}
