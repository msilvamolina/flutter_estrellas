import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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

  void changeThemeMode() {
    ThemeService.changeThemeMode();
    update(['themeButton']);
  }

  IconData getThemeIcon() {
    return ThemeService.isDark() ? Icons.light_mode : Icons.dark_mode;
  }
}
