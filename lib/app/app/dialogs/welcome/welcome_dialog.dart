import 'dart:ui';

import 'package:flutter/material.dart';

import 'welcome_screen.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: AlertDialog(
        content: Container(
          width: 400,
          child: WelcomeScreen(isDialog: true),
        ),
      ),
    );
  }
}
