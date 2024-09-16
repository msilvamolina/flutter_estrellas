import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';

class CustomInputDecoration {
  static InputDecoration inputDecoration(
          {String? text, String? hintText, IconData? icon}) =>
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
          borderSide: BorderSide(
              color: ThemeService.isDark() ? primaryBase : neutral950),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primaryBase),
        ),
      );
}
