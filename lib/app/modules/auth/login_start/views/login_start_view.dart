import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../components/appbar/login_appbar.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../themes/styles/colors.dart';
import '../controllers/login_start_controller.dart';

class LoginStartView extends GetView<LoginStartController> {
  const LoginStartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
        color: white,
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¿Ya tienes cuenta?',
                style: TypographyStyle.bodyRegularLarge,
              ),
              Button(
                onPressed: () => Get.toNamed(Routes.NEW_LOGIN),
                label: 'Inicia sesión',
                style: ButtonStyles.secondaryLink,
              ),
            ],
          ),
        ),
      ),
      appBar: LoginAppbar(),
      body: Container(
        color: white,
        child: Column(
          children: [
            Image.asset('assets/images/login-background.png'),
            SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: SvgPicture.asset('assets/svg/logo.svg')),
                  SizedBox(height: 66),
                  Text(
                    '¡Te damos la bienvenida\na Estrellas!',
                    style: TypographyStyle.bodyBlackLarge3
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 26),
                  Button(
                    style: ButtonStyles.secondary,
                    onPressed: controller.loginGoogle,
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
                  if (Platform.isIOS) ...[
                    Button(
                      style: ButtonStyles.secondary,
                      onPressed: () {},
                      image: Image.asset(
                        'assets/images/icon-apple.png',
                        width: 20,
                      ),
                      label: 'Continuar con Apple',
                    ),
                    SizedBox(height: 26),
                  ],
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Divider(
                          color: neutral300,
                          thickness: 2,
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          color: white,
                          child: Text(
                            'O',
                            style: TypographyStyle.bodyBlackMedium
                                .copyWith(color: neutral700),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 26),
                  Button(
                    style: ButtonStyles.primary,
                    onPressed: () => Get.toNamed(Routes.NEW_REGISTER),
                    label: 'Continuar con correo',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
