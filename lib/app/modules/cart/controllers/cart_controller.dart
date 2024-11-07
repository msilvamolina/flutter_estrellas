import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../../app/controllers/user_product_controller.dart';
import '../../../data/models/user_product_cart/user_product_cart_model.dart';

class CartController extends GetxController {
  MainController mainController = Get.find();
  UserProductController userProductController =
      Get.find<UserProductController>();

  void addFunction(UserProductCartModel userProductCartModel) {
    int _quantity = getQuantity(userProductCartModel);
    userProductController.mapProductsQuantity[userProductCartModel.id] =
        _quantity + 1;
    update(['card_product']);
  }

  int getQuantity(UserProductCartModel userProductCartModel) =>
      userProductController.mapProductsQuantity[userProductCartModel.id] ??
      userProductCartModel.quantity ??
      1;

  void minusFunction(UserProductCartModel userProductCartModel) {
    int _quantity = getQuantity(userProductCartModel);
    userProductController.mapProductsQuantity[userProductCartModel.id] =
        _quantity - 1;
    update(['card_product']);
  }
}
