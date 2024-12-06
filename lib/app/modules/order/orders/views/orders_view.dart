import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../controllers/orders_controller.dart';
import '../widgets/order_card.dart';
import 'orders_empty_state.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(
        title: 'Órdenes',
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              EstrellasIcons.slidersHorizontal,
            ),
          ),
        ],
      ),
      body: Obx(
        () => controller.userProductController.listOrder.isNotEmpty
            ? ListView.separated(
                itemCount: controller.userProductController.listOrder.length,
                itemBuilder: (context, index) {
                  return OrderCard(
                    order: controller.userProductController.listOrder[index],
                  );
                },
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Divider(
                    color: neutral300,
                  ),
                ),
              )
            : OrdersEmptyState(),
      ),
    );
  }
}
