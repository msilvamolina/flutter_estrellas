import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/buttons/buttons.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/order_success_controller.dart';

class OrderSuccessView extends GetView<OrderSuccessController> {
  const OrderSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/congrats.png';
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: -60,
              top: 80,
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
                    '¡Has realizado tu compra de manera exitosa!',
                    style: TypographyStyle.bodyBlackLarge
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Nos comunicaremos por whatsapp para mantenerte enterado del envío de tus productos',
                    style: TypographyStyle.bodyRegularLarge.copyWith(),
                  ),
                  SizedBox(height: 12),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Tu número de orden es ',
                      style: TypographyStyle.bodyRegularLarge
                          .copyWith(color: neutral800),
                      children: <TextSpan>[
                        TextSpan(
                          text: '440987766',
                          style: TypographyStyle.bodyRegularLarge
                              .copyWith(color: secondaryBase),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 22),
                  Button(
                    label: 'Entendido',
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
