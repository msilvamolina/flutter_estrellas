import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../controllers/cart_controller.dart';
import '../widget/cart_card.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        centerTitle: true,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              controller.userProductController.setUniqueProduct(null);
              Get.toNamed(Routes.ADDRESS);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: controller.mainController.isThemeModeDark
                  ? primaryDark
                  : primaryBase,
              foregroundColor: controller.mainController.isThemeModeDark
                  ? Colors.white
                  : Colors.black,
              side: BorderSide(
                color: controller.mainController.isThemeModeDark
                    ? primaryBase
                    : Colors.black, // Color del borde
                width: 1, // Ancho del borde
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: Text(
                'Continuar compra',
                textAlign: TextAlign.center,
                style: TypographyStyle.bodyRegularLarge
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.userProductController.listProductCart.isNotEmpty
            ? ListView.separated(
                itemCount:
                    controller.userProductController.listProductCart.length,
                itemBuilder: (context, index) {
                  return CartCard(
                    userProductModel:
                        controller.userProductController.listProductCart[index],
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              )
            : const Text('no data'),
      ),
    );
  }
}
