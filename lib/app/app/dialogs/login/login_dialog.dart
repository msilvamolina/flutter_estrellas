import 'dart:ui';

import 'package:flutter/material.dart';

import 'login_screen.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: AlertDialog(
        content: Container(
          width: 400,
          child: LoginScreen(isDialog: true),
        ),
      ),
    );
  }
}
