import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/dialogs/login/login_dialog.dart';
import 'package:flutter_estrellas/app/app/dialogs/login/login_screen.dart';
import 'package:flutter_estrellas/app/components/layouts/auth_layout.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';

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
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Hero(
              tag: 'themeButton',
              child: GetBuilder<MainController>(
                id: 'themeButton',
                builder: (mainController) {
                  return IconButton(
                    onPressed: mainController.changeThemeMode,
                    icon: Icon(mainController.getThemeIcon()),
                  );
                },
              ),
            ),
            Hero(
              tag: 'helpButton',
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.help_outline),
              ),
            ),
          ],
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: LoginScreen(),
        )),
      ),
    );
  }
}
