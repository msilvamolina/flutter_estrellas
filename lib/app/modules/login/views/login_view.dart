import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/dialogs/login/login_dialog.dart';
import 'package:flutter_estrellas/app/app/dialogs/login/login_screen.dart';
import 'package:flutter_estrellas/app/components/layouts/auth_layout.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool logoInitialScale = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Center(child: LoginScreen()),
    );
  }
}
