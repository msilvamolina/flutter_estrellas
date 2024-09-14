import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  ThemeService._();
  static final _getStorage = GetStorage();
  static const storageKey = 'isDarkMode';

  static ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  static bool isDark() {
    return ThemeService.getThemeMode() == ThemeMode.dark;
  }

  static bool isSavedDarkMode() {
    return _getStorage.read(storageKey) ?? false;
  }

  static void saveThemeMode(bool isDarkMode) {
    _getStorage.write(storageKey, isDarkMode);
  }

  static void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }
}
