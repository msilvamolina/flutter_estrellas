import 'package:get/get.dart';

import '../controllers/cart_unique_product_controller.dart';

class CartUniqueProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartUniqueProductController>(
      () => CartUniqueProductController(),
    );
  }
}
