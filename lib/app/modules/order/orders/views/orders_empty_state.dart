import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/buttons/buttons.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';

class OrdersEmptyState extends StatelessWidget {
  const OrdersEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/catalog.png';
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: -130,
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
                    'No tienes órdenes aún',
                    style: TypographyStyle.bodyBlackLarge
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '¡Explora productos y crea tu próxima orden!',
                    style: TypographyStyle.bodyRegularLarge.copyWith(),
                  ),
                  SizedBox(height: 22),
                  Button(
                    label: 'Explorar productos',
                    onPressed: () {
                      Get.back(result: 'ok');
                    },
                    style: ButtonStyles.primary,
                  ),
                  SizedBox(height: 22),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
