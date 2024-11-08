import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../../app/controllers/user_product_controller.dart';
import '../../../components/snackbars/snackbars.dart';
import '../../../data/models/user_product_cart/user_product_cart_model.dart';

class CartController extends GetxController {
  MainController mainController = Get.find();
  UserProductController userProductController =
      Get.find<UserProductController>();

  double _prices = 0;
  double get prices => _prices;

  int _points = 0;
  int get points => _points;

  int _quantity = 0;
  int get quantity => _quantity;

  @override
  void onReady() {
    calculateProducts();
    super.onReady();
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
      _quantity = 0;
      _prices = 0;
      _points = 0;
      for (UserProductCartModel element
          in userProductController.listProductCart) {
        int _productQuantity = getQuantity(element);
        double _productPrice = element.price * _productQuantity;
        int _elementPoints = element.points * _productQuantity;

        _quantity = _quantity + _productQuantity;
        _prices = _prices + _productPrice;
        _points = _points + _elementPoints;
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
}
