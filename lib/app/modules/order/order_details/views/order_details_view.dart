import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/appbar/estrellas_appbar.dart';
import '../../../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../../../themes/styles/colors.dart';
import '../controllers/order_details_controller.dart';
import '../widgets/order_details_bottom_sheet.dart';
import '../widgets/order_details_card.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(
        title: 'ID de venta: ${controller.order.orderId}',
        backgroundColor: neutral100,
      ),
      backgroundColor: neutral100,
      bottomNavigationBar: Container(
        color: white,
        child: SafeArea(
          child: OrderDetailsBottomSheet(
            orderModel: controller.order,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: controller.order.products.length,
        itemBuilder: (context, index) {
          return OrderDetailsCard(
            userProductCartModel: controller.order.products[index],
          );
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Divider(
            color: neutral300,
          ),
        ),
      ),
    );
  }
}
