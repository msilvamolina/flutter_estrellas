import 'package:get/get.dart';

import '../../../../data/models/order/order_model.dart';

class OrderDetailsController extends GetxController {
  late OrderModel order;

  @override
  void onInit() {
    order = Get.arguments as OrderModel;
    super.onInit();
  }
}
