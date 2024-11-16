import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';

import 'package:get/get.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(title: 'Órdenes'),
      body: const Center(
        child: Text(
          'OrdersView is working 22',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
