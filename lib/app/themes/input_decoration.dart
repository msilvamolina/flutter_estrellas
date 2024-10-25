import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';

import '../app/controllers/main_controller.dart';

class CustomInputDecoration {
  static InputDecoration inputDecoration({
    String? text,
    String? hintText,
    IconData? icon,
    bool? isThemeModeDark,
  }) {
    MainController mainController = Get.find<MainController>();
    Color labelBackgroundColor =
        mainController.isThemeModeDark ? secondaryDark : secondaryLight;

    Color labelForegroundColor =
        mainController.isThemeModeDark ? neutral300 : neutral900;

    Color border =
        mainController.isThemeModeDark ? secondaryLight : secondaryBase;

    return InputDecoration(
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: labelBackgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text ?? '',
          style: TypographyStyle.bodyRegularLarge
              .copyWith(color: labelForegroundColor, fontSize: 18),
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: hintText,
      prefixIcon: icon != null
          ? Icon(
              icon,
              color: border,
            )
          : null,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: border, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: border, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: border, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  static InputDecoration greenInputDecoration({
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
