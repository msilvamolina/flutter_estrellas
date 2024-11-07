import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/components/snackbars/snackbars.dart';
import 'package:flutter_estrellas/app/data/models/address/address_model.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/orders/orders_repository.dart';
import 'package:get/get.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../app/controllers/user_product_controller.dart';
import '../../../data/models/user_product/user_product_model.dart';
import '../../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../../data/providers/repositories/address/address_repository.dart';
import '../../../routes/app_pages.dart';

class SelectPaymentController extends GetxController {
  MainController mainController = Get.find();
  UserProductController userProductController =
      Get.find<UserProductController>();
  OrdersRepository ordersRepository = OrdersRepository();
  late AddressModel address;
  @override
  void onInit() {
    address = Get.arguments as AddressModel;
    super.onInit();
  }

  void confirmBuy() {
    if (userProductController.uniqueProduct != null) {
      buyUniqueProducts(userProductController.uniqueProduct!);
    } else {
      buyMultipleProducts();
    }
  }

  void buyUniqueProducts(UserProductModel product) async {
    mainController.showLoader(
      title: 'Procesando...',
      message: 'Por favor espere',
    );

    Either<String, Unit> response =
        await ordersRepository.createOrder(product: product, address: address);

    Get.back();
    response.fold((failure) {
      Snackbars.error(failure);
    }, (_) {
      Get.offAndToNamed(Routes.ORDER_SUCCESS);
    });
  }

  void buyMultipleProducts() async {
    List<dynamic> products = [];

    if (userProductController.listProductCart.isNotEmpty) {
      for (UserProductCartModel element
          in userProductController.listProductCart) {
        products.add(
          {
            "video_id": element.video!.id,
            "client_quantity": element.quantity ?? 1,
            "variation_id": ""
          },
        );
      }
    }

    mainController.showLoader(
      title: 'Procesando...',
      message: 'Por favor espere',
    );

    Either<String, Unit> response = await ordersRepository.createMultipleOrder(
        products: products, address: address);

    Get.back();
    response.fold((failure) {
      Snackbars.error(failure);
    }, (_) {
      Get.offAndToNamed(Routes.ORDER_SUCCESS);
    });
  }
}
