import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../libraries/icons/icons_font.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/home_controller.dart';

class CartBadget extends StatelessWidget {
  const CartBadget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                EstrellasIcons.shoppingCartSimpleFill,
                color: Colors.black.withOpacity(0.2),
                size: 42,
              ),
            ),
            IconButton(
              onPressed: controller.goToCart,
              icon: Icon(
                EstrellasIcons.shoppingCartSimpleFill,
                color: white,
                size: 40,
              ),
            ),
            if (controller.userProductController.listProductCart.length > 0)
              Positioned(
                right: 6,
                top: 8,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: error900,
                  child: Text(
                    controller.userProductController.listProductCart.length
                        .toString(),
                    style: TypographyStyle.bodyBlackSmall
                        .copyWith(color: white, fontSize: 12),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
