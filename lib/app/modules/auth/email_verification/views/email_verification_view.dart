import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/appbar/login_appbar.dart';
import '../../../../components/buttons/buttons.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(''),
        actions: [
          Button(
            onPressed: controller.signOut,
            style: ButtonStyles.secondaryText,
            label: 'Salir',
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Button(
            label: 'Entendido',
            onPressed: () {},
            style: ButtonStyles.primary,
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
                    style: TypographyStyle.bodyBlackLarge
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Obx(
                    () => RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Te enviamos un enlace de validación a ',
                        style: TypographyStyle.bodyRegularLarge
                            .copyWith(color: neutral800),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${controller.userEmail}',
                            style: TypographyStyle.bodyBlackLarge
                                .copyWith(color: secondaryBase),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Ten en cuenta revisar tu bandeja de spam.',
                    style: TypographyStyle.bodyRegularLarge
                        .copyWith(color: neutral800),
                  ),
                  SizedBox(height: 8),
                  Obx(
                    () => AnimatedCrossFade(
                      duration: Duration(milliseconds: 300),
                      crossFadeState: !controller.isCountdownComplete.value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Container(
                        width: double.infinity,
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: 'Puedes pedir otro código en ',
                            style: TypographyStyle.bodyRegularMedium
                                .copyWith(color: neutral800),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${controller.timeLeft.value}s',
                                style: TypographyStyle.bodyRegularMedium
                                    .copyWith(color: secondaryBase),
                              ),
                            ],
                          ),
                        ),
                      ),
                      secondChild: Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text(
                              '¿No te llegó el correo?',
                              textAlign: TextAlign.start,
                              style:
                                  TypographyStyle.bodyRegularMedium.copyWith(),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
