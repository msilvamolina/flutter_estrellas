import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/components/buttons/buttons.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(title: 'Órdenes'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Button(
            label: 'Ordenes',
            onPressed: () {
              Get.toNamed(Routes.ORDER_DETAILS);
            },
            style: ButtonStyles.secondary,
          ),
        ),
      ),
    );
  }
}
