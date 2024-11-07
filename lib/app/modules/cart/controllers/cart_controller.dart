import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../../app/controllers/user_product_controller.dart';
import '../../../data/models/user_product_cart/user_product_cart_model.dart';

class CartController extends GetxController {
  MainController mainController = Get.find();
  UserProductController userProductController =
      Get.find<UserProductController>();

  Map<String, int> mapQuantity = {};

  void addFunction(UserProductCartModel userProductCartModel) {
    print('addFunction');
    print('${userProductCartModel.id}');
  }

  int getQuantity(UserProductCartModel userProductCartModel) {
    print('getQuantity');
    print('${userProductCartModel.id}');
    return 3;
  }

  void minusFunction(UserProductCartModel userProductCartModel) {
    print('minusFunction');
    print('${userProductCartModel.id}');
  }
}
