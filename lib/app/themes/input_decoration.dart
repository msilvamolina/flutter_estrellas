import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:get/get.dart';

import '../app/controllers/main_controller.dart';

class CustomInputDecoration {
  static InputDecoration inputDecoration({
    bool isThemeModeDark = false,
    String? text,
    String? hintText,
    IconData? icon,
  }) =>
      InputDecoration(
        labelText: text,
        hintText: hintText,
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: primaryBase,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: isThemeModeDark ? primaryBase : neutral950),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primaryBase),
        ),
      );
}
