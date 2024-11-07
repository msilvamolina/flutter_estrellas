import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../../../components/buttons/buttons.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../controllers/cart_controller.dart';
import '../widget/cart_card.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'Carrito',
          style: TypographyStyle.bodyBlackLarge,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Button(
            onPressed: () {},
            label: 'Continuar compra',
            style: ButtonStyles.primary,
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
            : Center(child: const Text('no data')),
      ),
    );
  }
}
