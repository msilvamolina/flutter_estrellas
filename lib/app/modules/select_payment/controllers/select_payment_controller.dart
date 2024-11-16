import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/snackbars/snackbars.dart';
import 'package:flutter_estrellas/app/data/models/address/address_model.dart';
import 'package:flutter_estrellas/app/data/models/payments_types/payments_types_model.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/orders/orders_repository.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
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

  List<PaymentsTypesModel> _paymentsList = [];
  List<PaymentsTypesModel> get paymentsList => _paymentsList;

  RxnString selectedPayment = RxnString();

  @override
  void onInit() {
    address = Get.arguments as AddressModel;

    _paymentsList.add(
      PaymentsTypesModel(
        id: '0',
        title: 'Pago contra entrega',
        icon: EstrellasIcons.moneyWavy,
      ),
    );
    _paymentsList.add(
      PaymentsTypesModel(
        id: '1',
        title: 'Crédito Addi',
        image: 'assets/images/addi.png',
      ),
    );
    _paymentsList.add(
      PaymentsTypesModel(
        id: '2',
        title: 'Tranferencia PSE',
        image: 'assets/images/pse.png',
      ),
    );
    _paymentsList.add(
      PaymentsTypesModel(
        id: '3',
        title: 'Agregar tarjeta crédito',
        icon: EstrellasIcons.creditCard,
      ),
    );
    _paymentsList.add(
      PaymentsTypesModel(
        id: '4',
        title: 'Agregar tarjeta débito',
        icon: EstrellasIcons.creditCard,
      ),
    );
    super.onInit();
  }

  void onSelectedPayment(String id) {
    selectedPayment.value = id;
  }

  Future<void> confirmBuy() async {
    if (userProductController.uniqueProduct != null) {
      buyUniqueProducts(userProductController.uniqueProduct!);
    } else {
      buyMultipleProducts();
    }
  }

  void buyUniqueProducts(UserProductCartModel product) async {
    mainController.showLoader(
      title: 'Estamos procesando tu compra',
    );

    Either<String, String> response =
        await ordersRepository.createOrder(product: product, address: address);

    await Future.delayed(Duration(seconds: 1));
    Get.back();

    response.fold((failure) {
      Get.toNamed(Routes.ORDER_ERROR, arguments: failure);
    }, (orderNumber) {
      Get.offAndToNamed(Routes.ORDER_SUCCESS, arguments: orderNumber);
    });
  }

  void buyMultipleProducts() async {
    List<dynamic> products = [];

    if (userProductController.listProductCart.isNotEmpty) {
      for (UserProductCartModel element
          in userProductController.listProductCart) {
        products.add(
          {
            "product_id": element.video!.product!.id,
            "client_quantity": element.quantity ?? 1,
            "variation_id": ""
          },
        );
      }
    }

    mainController.showLoader(
      title: 'Estamos procesando tu compra',
    );

    Either<String, String> response = await ordersRepository
        .createMultipleOrder(products: products, address: address);

    response.fold((failure) {
      Get.back();
      Get.toNamed(Routes.ORDER_ERROR, arguments: failure);
    }, (orderNumber) async {
      await userProductController.clearCart();
      Get.back();
      Get.offAndToNamed(Routes.ORDER_SUCCESS, arguments: orderNumber);
    });
  }
}
