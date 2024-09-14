import 'package:flutter/material.dart';

import 'colors.dart' as colors;

const String font = 'Montserrat';

const TextStyle textStyle = TextStyle(
  fontFamily: font,
  color: colors.white,
);

const double _display1Size = 30;
const double _display2Size = 25;
const double _display3Size = 24.99;
const double _display4Size = 22;
const double _headline1Size = 19;
const double _headline2Size = 16;
const double _body1Size = 15;
const double _body2Size = 13;
const double _body3Size = 12;
const double _legalSize = 11;
const double _tagSize = 10;
const double _captionSize = 9;

abstract class TypographyStyle {
  TypographyStyle._();

  static TextStyle display1 = textStyle.copyWith(
    fontSize: _display1Size,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle display2 = textStyle.copyWith(
    fontSize: _display2Size,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle display3 = textStyle.copyWith(
    fontSize: _display3Size,
    height: 1.2,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle display4 = textStyle.copyWith(
    fontSize: _display4Size,
    height: 1.55,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle headline1 = textStyle.copyWith(
    fontSize: _headline1Size,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle headline2 = textStyle.copyWith(
    fontSize: _headline2Size,
    height: 1.37,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle body1 = textStyle.copyWith(
    fontSize: _body1Size,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle body2 = textStyle.copyWith(
    fontSize: _body2Size,
    height: 1.38,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle body3 = textStyle.copyWith(
    fontSize: _body3Size,
    height: 1.41,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle legal = textStyle.copyWith(
    fontSize: _legalSize,
    height: 1.27,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle tag = textStyle.copyWith(
    fontSize: _tagSize,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  static TextStyle caption = textStyle.copyWith(
    fontSize: _captionSize,
    height: 1.33,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );
}

extension BetterString on String {
  String get text => this;

  String capitalize() {
    List<String> listString = text.split('');

    return listString[0].toUpperCase() +
        listString.sublist(1).join().toLowerCase();
  }

  TextStyle get display1 => TypographyStyle.display1.copyWith(
        fontFamilyFallback: <String>[text],
      );

  TextStyle get display2 => TypographyStyle.display2.copyWith(
        fontFamilyFallback: <String>[text],
      );

  TextStyle get display3 => TypographyStyle.display3.copyWith(
        fontFamilyFallback: <String>[text],
      );

  TextStyle get display4 => TypographyStyle.display4.copyWith(
        fontFamilyFallback: <String>[text],
      );

  TextStyle get headline1 => TypographyStyle.headline1.copyWith(
        fontFamilyFallback: <String>[text],
      );

  TextStyle get headline2 => TypographyStyle.headline2.copyWith(
        fontFamilyFallback: <String>[text],
      );

  TextStyle get body1 => TypographyStyle.body1.copyWith(
        fontFamilyFallback: <String>[text],
      );

  TextStyle get body2 => TypographyStyle.body2.copyWith(
        fontFamilyFallback: <String>[text],
      );

  TextStyle get body3 => TypographyStyle.body3.copyWith(
        fontFamilyFallback: <String>[text],
      );

  TextStyle get legal => TypographyStyle.legal.copyWith(
        fontFamilyFallback: <String>[text],
      );
}
