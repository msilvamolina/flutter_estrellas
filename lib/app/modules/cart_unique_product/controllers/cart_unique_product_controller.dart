import 'package:get/get.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../app/controllers/user_product_controller.dart';
import '../../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../../routes/app_pages.dart';

class CartUniqueProductController extends GetxController {
  MainController mainController = Get.find();
  UserProductController userProductController =
      Get.find<UserProductController>();

  void buyAction() {
    Get.toNamed(Routes.ADDRESS);
  }
}
