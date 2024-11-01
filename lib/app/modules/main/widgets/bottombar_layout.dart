import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../libraries/icons/icons_font.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../home/controllers/home_controller.dart';
import 'bottombar.dart';

class BottombarLayout extends StatelessWidget {
  const BottombarLayout({
    required this.viewSelected,
    required this.child,
    this.isDarkTheme = false,
    super.key,
  });

  final Widget child;
  final int viewSelected;
  final bool isDarkTheme;
  @override
  Widget build(BuildContext context) {
    bool isIos = false;
    bool isAndroid = false;

    if (!kIsWeb) {
      isIos = Platform.isIOS;
      isAndroid = Platform.isAndroid;
    }
    return Stack(
      children: [
        child,
        Positioned(
          bottom: isAndroid ? 36 : 26,
          left: 16,
          right: 16,
          child: Bottombar(
            viewSelected: viewSelected,
            isDarkTheme: isDarkTheme,
          ),
        ),
      ],
    );
  }
}
