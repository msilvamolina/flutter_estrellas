import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
