import 'package:flutter/material.dart';

const double _h1DesktopSize = 61;
const double _h2DesktopSize = 49;
const double _h3DesktopSize = 39;
const double _h1MobileSize = 32;
const double _h2MobileSize = 26;
const double _h3MobileSize = 20;
const double _h4MobileSize = 18;
const double _bodyLargeSize = 16;
const double _bodyMediumSize = 14;
const double _bodySmallSize = 12;

const TextStyle textStyle = TextStyle(
  fontFamily: 'Montserrat',
);

abstract class TypographyStyle {
  TypographyStyle._();

  static TextStyle h1Desktop = textStyle.copyWith(
    fontSize: _h1DesktopSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );
  static TextStyle h2Desktop = textStyle.copyWith(
    fontSize: _h2DesktopSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );
  static TextStyle h3Desktop = textStyle.copyWith(
    fontSize: _h3DesktopSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );
  static TextStyle h1Mobile = textStyle.copyWith(
    fontSize: _h1MobileSize,
    height: 1.16,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );
  static TextStyle h2Mobile = textStyle.copyWith(
    fontSize: _h2MobileSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );
  static TextStyle h3Mobile = textStyle.copyWith(
    fontSize: _h3MobileSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );
  static TextStyle h4Mobile = textStyle.copyWith(
    fontSize: _h4MobileSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );
  static TextStyle bodyRegularLarge = textStyle.copyWith(
    fontSize: _bodyLargeSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodyRegularMedium = textStyle.copyWith(
    fontSize: _bodyMediumSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodyRegularSmall = textStyle.copyWith(
    fontSize: _bodySmallSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodyBlackLarge = textStyle.copyWith(
    fontSize: _bodyLargeSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );
  static TextStyle bodyBlackMedium = textStyle.copyWith(
    fontSize: _bodyMediumSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );
  static TextStyle bodyBlackSmall = textStyle.copyWith(
    fontSize: _bodySmallSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );
  static TextStyle linkRegularLarge = textStyle.copyWith(
    fontSize: _bodyLargeSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );
  static TextStyle linkRegularMedium = textStyle.copyWith(
    fontSize: _bodyMediumSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );
  static TextStyle linkRegularSmall = textStyle.copyWith(
    fontSize: _bodySmallSize,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );
}
