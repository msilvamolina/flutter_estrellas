import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../../../components/buttons/buttons.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../controllers/cart_controller.dart';
import '../widget/cart_card.dart';
import '../widget/cart_empty_state.dart';
import '../widget/cart_price_bottom_sheet.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: EstrellasAppbar(title: 'Carrito'),
      bottomNavigationBar: Obx(
        () => controller.userProductController.listProductCart.isNotEmpty
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => CartPriceBottomBar(
                          productsProfit:
                              controller.userProductController.cartProfit.value,
                          productsPoints:
                              controller.userProductController.cartPoints.value,
                          productsQuantity: controller
                              .userProductController.cartQuantity.value,
                          productsPrices:
                              controller.userProductController.cartPrices.value,
                          productsShipping: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Button(
                          onPressed: controller.buyAction,
                          label: 'Continuar compra',
                          style: ButtonStyles.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox.shrink(),
      ),
      body: Obx(
        () => controller.userProductController.listProductCart.isNotEmpty
            ? ListView.separated(
                itemCount:
                    controller.userProductController.listProductCart.length,
                itemBuilder: (context, index) {
                  return CartCard(
                    userProductCartModel:
                        controller.userProductController.listProductCart[index],
                  );
                },
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Divider(
                    color: neutral300,
                  ),
                ),
              )
            : CartEmptyState(),
      ),
    );
  }
}
