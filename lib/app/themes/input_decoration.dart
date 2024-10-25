import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

class CustomInputDecoration {
  static InputDecoration inputDecoration({
    bool isThemeModeDark = false,
    String? text,
    String? hintText,
    IconData? icon,
  }) =>
      InputDecoration(
        label: Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
            color: secondaryLight,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            text ?? '',
            style: TypographyStyle.bodyRegularLarge
                .copyWith(color: neutral900, fontSize: 18),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: secondaryBase,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryBase, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryBase, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryBase, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
      );

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
