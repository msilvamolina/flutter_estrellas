import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../../app/controllers/user_product_controller.dart';
import '../../../components/snackbars/snackbars.dart';
import '../../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../../routes/app_pages.dart';

class CartController extends GetxController {
  MainController mainController = Get.find();
  UserProductController userProductController =
      Get.find<UserProductController>();

  @override
  void onReady() {
    calculateProducts();
    super.onReady();
  }

  void refreshCardProducts() {
    update(['card_product']);
    calculateProducts();
  }

  void addFunction(UserProductCartModel userProductCartModel) {
    int _quantity = getQuantity(userProductCartModel);
    userProductController.mapProductsQuantity[userProductCartModel.id] =
        _quantity + 1;
    update(['card_product']);
    calculateProducts();
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
    calculateProducts();
  }

  void calculateProducts() {
    if (userProductController.listProductCart.isNotEmpty) {
      userProductController.cartQuantity.value = 0;
      userProductController.cartPrices.value = 0;
      userProductController.cartPoints.value = 0;
      userProductController.cartProfit.value = 0;

      for (UserProductCartModel element
          in userProductController.listProductCart) {
        int _productQuantity = getQuantity(element);

        double profit = userProductController.getProductProfit(
          price: element.price,
          suggestedPrice: element.suggestedPrice,
          providerId: element.providerId,
        );
        double _productPrice = element.suggestedPrice * _productQuantity;
        double _productProfit = profit * _productQuantity;
        int _elementPoints = element.points * _productQuantity;

        userProductController.cartQuantity.value =
            userProductController.cartQuantity.value + _productQuantity;
        userProductController.cartPrices.value =
            userProductController.cartPrices.value + _productPrice;
        userProductController.cartPoints.value =
            userProductController.cartPoints.value + _elementPoints;

        userProductController.cartProfit.value =
            userProductController.cartProfit.value + _productProfit;
      }
      update(['prices_bottombar']);
    }
  }

  Future<void> removeProduct(UserProductCartModel userProductCartModel) async {
    Either<String, Unit> response = await userProductController
        .userProductRepository
        .removeFromCart(cart: userProductCartModel);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Snackbars.success(
            '${userProductCartModel.video!.product!.name} removido de tu carrito');
        calculateProducts();
      },
    );
    update(['card_product']);
  }

  void buyAction() {
    userProductController.setUniqueProduct(null);
    Get.toNamed(Routes.ADDRESS);
  }
}
