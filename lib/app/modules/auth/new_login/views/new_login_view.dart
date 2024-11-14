import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/inputs/password_input.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../components/appbar/login_appbar.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../components/inputs/text_input.dart';
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
        body: ReactiveFormBuilder(
          form: controller.buildForm,
          builder: (context, form, child) {
            return SafeArea(
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
                          style: TypographyStyle.bodyBlackLarge.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Inicia sesión para continuar explorando',
                          style: TypographyStyle.bodyRegularLarge.copyWith(),
                        ),
                        SizedBox(height: 26),
                        CustomTextInput(
                          autofocus: false,
                          formControlName: Fields.email.name,
                          keyboardType: TextInputType.emailAddress,
                          label: 'Correo',
                          hintText: 'Ingresa tu correo',
                        ),
                        SizedBox(height: 28),
                        Obx(
                          () => PasswordInput(
                            autofocus: false,
                            isObscure: controller.isObscure.value,
                            obscurePressed: controller.obscurePressed,
                            formControlName: Fields.password.name,
                            keyboardType: TextInputType.text,
                            label: 'Contraseña',
                            hintText: 'Ingresa tu contraseña',
                          ),
                        ),
                        SizedBox(height: 16),
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
            );
          },
        ));
  }
}
