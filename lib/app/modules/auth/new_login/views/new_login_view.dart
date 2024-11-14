import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/appbar/login_appbar.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/new_login_controller.dart';

class NewLoginView extends GetView<NewLoginController> {
  const NewLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/auth.png';
    return Scaffold(
      backgroundColor: white,
      appBar: LoginAppbar(),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: -120,
              top: 40,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  image,
                  width: 320,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  Image.asset(
                    image,
                    width: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '¡Bienvenido de vuelta!',
                    style: TypographyStyle.bodyBlackLarge
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Inicia sesión para continuar explorando',
                    style: TypographyStyle.bodyRegularLarge.copyWith(),
                  ),
                  SizedBox(height: 22),
                  Center(
                    child: Button(
                      label: 'Olvidé mi contraseña',
                      onPressed: () {},
                      style: ButtonStyles.secondaryLink,
                    ),
                  ),
                  SizedBox(height: 16),
                  Button(
                    label: 'Continuar',
                    onPressed: () {},
                    style: ButtonStyles.primary,
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
