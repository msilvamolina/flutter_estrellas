import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/buttons/buttons.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/order_error_controller.dart';

class OrderErrorView extends GetView<OrderErrorController> {
  const OrderErrorView({super.key});
  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/money.png';
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: -80,
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
                    'Ups',
                    style: TypographyStyle.bodyBlackLarge
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    controller.message,
                    style: TypographyStyle.bodyRegularLarge.copyWith(),
                  ),
                  SizedBox(height: 22),
                  Button(
                    label: 'Volver a intentar',
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyles.primary,
                  ),
                  SizedBox(height: 18),
                  Center(
                    child: Button(
                      label: '¿Necesitas ayuda?',
                      onPressed: () {},
                      style: ButtonStyles.secondaryLink,
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
