import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_unique_product_controller.dart';

class CartUniqueProductView extends GetView<CartUniqueProductController> {
  const CartUniqueProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartUniqueProductView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CartUniqueProductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
