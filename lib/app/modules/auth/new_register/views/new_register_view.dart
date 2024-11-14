import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/step_indicator/step_indicator.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../components/appbar/login_appbar.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../components/inputs/password_input.dart';
import '../../../../components/inputs/text_input.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/new_register_controller.dart';
import '../widgets/check_password_card.dart';

class NewRegisterView extends GetView<NewRegisterController> {
  const NewRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/auth.png';
    return Scaffold(
        backgroundColor: white,
        appBar: LoginAppbar(),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Button(
              label: 'Continuar',
              onPressed: () {},
              style: ButtonStyles.primary,
            ),
          ),
        ),
        body: ReactiveFormBuilder(
          form: controller.buildForm,
          builder: (context, form, child) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      StepIndicator(
                        currentStep: 1,
                        totalSteps: 3,
                      ),
                      SizedBox(height: 24),
                      Image.asset(
                        image,
                        width: 100,
                      ),
                      SizedBox(height: 20),
                      Text(
                        '¡Regístrate y comienza!',
                        style: TypographyStyle.bodyBlackLarge.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Crea tu cuenta de forma sencilla',
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
                          onChanged: controller.onPasswordChanged,
                          isObscure: controller.isObscure.value,
                          obscurePressed: controller.obscurePressed,
                          formControlName: Fields.password.name,
                          keyboardType: TextInputType.text,
                          label: 'Contraseña',
                          hintText: 'Ingresa tu contraseña',
                        ),
                      ),
                      SizedBox(height: 28),
                      Obx(
                        () => PasswordInput(
                          autofocus: false,
                          isObscure: controller.isObscure2.value,
                          obscurePressed: controller.obscure2Pressed,
                          formControlName: Fields.passwordConfirmation.name,
                          keyboardType: TextInputType.text,
                          label: 'Confirma la contraseña',
                          hintText: 'Ingresa tu contraseña',
                        ),
                      ),
                      SizedBox(height: 24),
                      CheckPasswordCard(),
                      SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
