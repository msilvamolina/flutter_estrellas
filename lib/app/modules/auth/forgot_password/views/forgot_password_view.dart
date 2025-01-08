import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../components/appbar/login_appbar.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../components/inputs/text_input.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/locker.png';
    return ReactiveFormBuilder(
        form: controller.buildForm,
        builder: (context, form, child) {
          return Scaffold(
            backgroundColor: white,
            appBar: LoginAppbar(),
            extendBodyBehindAppBar: true,
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 16),
                    ReactiveFormConsumer(
                      builder: (context, form, child) => Button(
                        label: 'Continuar',
                        onPressed: (form.valid)
                            ? () => controller.sendForm(form.value)
                            : null,
                        style: ButtonStyles.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                          'Recuperar contraseña',
                          style: TypographyStyle.bodyBlackLarge.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Ingresa tu correo registrado y te enviaremos un código de validación',
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
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
