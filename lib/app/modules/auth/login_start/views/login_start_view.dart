import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'package:get/get.dart';

import '../../../../components/buttons/buttons.dart';
import '../../../../themes/styles/colors.dart';
import '../controllers/login_start_controller.dart';

class LoginStartView extends GetView<LoginStartController> {
  const LoginStartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(''),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'Ayuda',
                    style: TypographyStyle.bodyRegularLarge,
                  ),
                  Icon(
                    EstrellasIcons.question,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: white,
        child: Column(
          children: [
            Image.asset('assets/images/login-background.png'),
            SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Button(
                    style: ButtonStyles.secondary,
                    onPressed: () {},
                    image: Image.asset(
                      'assets/images/icon-google.png',
                      width: 24,
                    ),
                    label: 'Continuar con Google',
                  ),
                  SizedBox(height: 26),
                  Button(
                    style: ButtonStyles.secondary,
                    onPressed: () {},
                    image: Image.asset(
                      'assets/images/icon-facebook.png',
                      width: 24,
                    ),
                    label: 'Continuar con Facebook',
                  ),
                  SizedBox(height: 26),
                  Button(
                    style: ButtonStyles.secondary,
                    onPressed: () {},
                    image: Image.asset(
                      'assets/images/icon-apple.png',
                      width: 20,
                    ),
                    label: 'Continuar con Apple',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
