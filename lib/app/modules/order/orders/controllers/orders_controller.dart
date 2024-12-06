import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../app/controllers/user_product_controller.dart';
import '../../../../data/models/order/order_model.dart';

class OrdersController extends GetxController {
  MainController mainController = Get.find<MainController>();
  UserProductController userProductController =
      Get.find<UserProductController>();

  final RxList<OrderModel> _filteredList = <OrderModel>[].obs;
  final TextEditingController searchController = TextEditingController();

  RxBool showCancelButton = false.obs;
  List<OrderModel> get filteredList => _filteredList;

  @override
  void onInit() {
    super.onInit();
    _filteredList.assignAll(userProductController.listOrder);
  }

  void filterList(String query) {
    if (query.isEmpty) {
      showCancelButton.value = false;
      _filteredList.assignAll(userProductController.listOrder);
    } else {
      showCancelButton.value = true;

      _filteredList.assignAll(
        userProductController.listOrder
            .where((item) => item.orderId.toString().contains(query))
            .toList(),
      );
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
