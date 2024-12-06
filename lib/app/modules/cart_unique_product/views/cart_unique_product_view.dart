import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/appbar/estrellas_appbar.dart';
import '../../../components/buttons/buttons.dart';
import '../../../themes/styles/colors.dart';
import '../../cart/widget/cart_card.dart';
import '../../cart/widget/cart_price_bottom_sheet.dart';
import '../controllers/cart_unique_product_controller.dart';
import '../widgets/cart_unique_card.dart';

class CartUniqueProductView extends GetView<CartUniqueProductController> {
  const CartUniqueProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: EstrellasAppbar(title: 'Carrito'),
      bottomNavigationBar: SafeArea(
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
                  productsQuantity:
                      controller.userProductController.cartQuantity.value,
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
      ),
      body: CartUniqueCard(
        userProductCartModel: controller.userProductController.uniqueProduct!,
      ),
    );
  }
}
