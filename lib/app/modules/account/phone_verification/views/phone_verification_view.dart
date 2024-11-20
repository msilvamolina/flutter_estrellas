import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/buttons/buttons.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../../auth/email_verification/widgets/custom_pin_input_code.dart';
import '../controllers/phone_verification_controller.dart';

class PhoneVerificationView extends GetView<PhoneVerificationController> {
  const PhoneVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/chat.png';
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(''),
      ),
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
                    'Validación de celular',
                    style: TypographyStyle.bodyBlackLarge
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text:
                          'Te hemos enviado por mensaje de texto un código de 6 dígitos a tu celular ',
                      style: TypographyStyle.bodyRegularLarge
                          .copyWith(color: neutral800),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '+${controller.phone.countryCode!} ${controller.phone.number}',
                          style: TypographyStyle.bodyBlackLarge
                              .copyWith(color: secondaryBase),
                        ),
                      ],
                    ),
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
                      crossFadeState: !controller.isCountdownComplete.value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Container(
                        width: double.infinity,
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: 'Puedes pedir otro código en ',
                            style: TypographyStyle.bodyRegularLarge
                                .copyWith(color: neutral800),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${controller.timeLeft.value}s',
                                style: TypographyStyle.bodyBlackLarge
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
                              '¿No te llegó el código?',
                              textAlign: TextAlign.start,
                              style:
                                  TypographyStyle.bodyRegularLarge.copyWith(),
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
      ),
    );
  }
}
