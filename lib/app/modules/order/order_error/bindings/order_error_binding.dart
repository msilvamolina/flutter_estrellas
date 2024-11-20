import 'package:get/get.dart';

import '../controllers/order_error_controller.dart';

class OrderErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderErrorController>(
      () => OrderErrorController(),
    );
  }
}
