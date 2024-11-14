import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../components/appbar/login_appbar.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../components/inputs/text_input.dart';
import '../../../../components/step_indicator/step_indicator.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/email_verification_controller.dart';
import '../widgets/custom_pin_input_code.dart';

class EmailVerificationView extends GetView<EmailVerificationController> {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/chat.png';
    return Scaffold(
        backgroundColor: white,
        appBar: LoginAppbar(),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Button(
              label: 'Verificar código',
              onPressed: () {},
              style: ButtonStyles.primary,
            ),
          ),
        ),
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
                        StepIndicator(
                          currentStep: 2,
                          totalSteps: 3,
                        ),
                        Spacer(),
                        Image.asset(
                          image,
                          width: 100,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Validación de cuenta',
                          style: TypographyStyle.bodyBlackLarge.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Te enviamos un código de 5 dígitos a daldana@gmail.com',
                          style: TypographyStyle.bodyRegularLarge.copyWith(),
                        ),
                        SizedBox(height: 26),
                        CustomPinInputCode(
                          length: 6,
                          validator: (value) {
                            return value == '123456' ? null : 'Código inválido';
                          },
                          onCompleted: (pin) {
                            print('Código ingresado: $pin');
                          },
                          onChanged: (value) {
                            print('Cambio en el código: $value');
                          },
                        ),
                        SizedBox(height: 26),
                        Obx(
                          () => AnimatedCrossFade(
                            duration: Duration(milliseconds: 300),
                            crossFadeState:
                                !controller.isCountdownComplete.value
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                            firstChild: Container(
                              width: double.infinity,
                              child: Text(
                                'Puedes pedir otro código en ${controller.timeLeft.value}',
                                textAlign: TextAlign.start,
                                style:
                                    TypographyStyle.bodyRegularLarge.copyWith(),
                              ),
                            ),
                            secondChild: Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text(
                                    '¿No te llegó el código?',
                                    textAlign: TextAlign.start,
                                    style: TypographyStyle.bodyRegularLarge
                                        .copyWith(),
                                  ),
                                  Button(
                                    onPressed: controller.tryAgain,
                                    style: ButtonStyles.secondaryLink,
                                    label: 'Volver a enviar',
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
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
