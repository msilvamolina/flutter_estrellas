import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../app/controllers/main_controller.dart';

class CustomInputDecoration {
  static InputDecoration inputDecoration({
    String? text,
    String? hintText,
    IconData? icon,
    bool? isThemeModeDark,
    Widget? suffixIcon,
  }) {
    MainController mainController = Get.find<MainController>();
    Color labelBackgroundColor =
        mainController.isThemeModeDark ? secondaryDark : secondaryLight;

    Color labelForegroundColor =
        mainController.isThemeModeDark ? neutral300 : neutral900;

    Color borderColor =
        mainController.isThemeModeDark ? secondaryLight : secondaryBase;

    Color errorColor = error900;

    return InputDecoration(
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: labelBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text ?? '',
          style: TypographyStyle.bodyRegularLarge.copyWith(
            color: labelForegroundColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: hintText,
      prefixIcon: icon != null
          ? Icon(
              icon,
              color: borderColor,
            )
          : null,
      suffixIcon: Icon(
        Icons.error,
        color: errorColor,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorColor, width: 2.0),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorColor, width: 2.0),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 2.0),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 2.0),
        borderRadius: BorderRadius.circular(12),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 2.0),
        borderRadius: BorderRadius.circular(12),
      ),
      errorStyle: TextStyle(
        color: errorColor,
        fontSize: 14,
      ),
    );
  }

  static InputDecoration inputDecorationControl({
    String? text,
    String? hintText,
    IconData? icon,
    bool? isThemeModeDark,
    bool isSubmited = false,
    Widget? suffixIcon,
    required FormControl control,
  }) {
    MainController mainController = Get.find<MainController>();
    Color errorLabelBackgroundColor =
        mainController.isThemeModeDark ? error500 : error50;
    Color errorLabelForegroundColor =
        !mainController.isThemeModeDark ? error500 : error50;

    Color labelBackgroundColor =
        mainController.isThemeModeDark ? secondaryDark : secondaryLight;

    Color labelForegroundColor =
        mainController.isThemeModeDark ? neutral300 : neutral900;

    Color borderColor =
        mainController.isThemeModeDark ? secondaryBase : secondaryBase;

    Color borderColorGrey = neutral600;
    Color errorColor = mainController.isThemeModeDark ? error500 : error900;

    bool showErrors = control.invalid && control.touched;
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
          vertical: 20.0, horizontal: 16), // Aumenta la altura
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: showErrors ? errorLabelBackgroundColor : labelBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text ?? '',
          style: TypographyStyle.bodyRegularLarge.copyWith(
            color:
                showErrors ? errorLabelForegroundColor : labelForegroundColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: hintText,
      hintStyle: TypographyStyle.bodyRegularLarge,
      prefixIcon: icon != null
          ? Icon(
              icon,
              color: borderColor,
            )
          : null,

      suffixIcon: (showErrors)
          ? Icon(
              Icons.error,
              color: errorColor,
            )
          : suffixIcon,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorColor, width: 2.0),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorColor, width: 2.0),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColorGrey, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderColorGrey, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      errorStyle: TextStyle(
        color: errorColor,
        fontSize: 14,
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
