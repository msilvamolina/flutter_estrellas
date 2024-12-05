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
import '../payments_web_screen.dart';

class SelectPaymentController extends GetxController {
  MainController mainController = Get.find();
  UserProductController userProductController =
      Get.find<UserProductController>();
  OrdersRepository ordersRepository = OrdersRepository();
  late AddressModel address;

  List<PaymentsTypesModel> _paymentsList = [];
  List<PaymentsTypesModel> get paymentsList => _paymentsList;

  RxnString selectedPayment = RxnString();
  RxBool showBottomBar = false.obs;

  @override
  void onInit() {
    address = Get.arguments as AddressModel;

    _paymentsList.add(
      PaymentsTypesModel(
        id: '0',
        title: 'Pago contra entrega',
        icon: EstrellasIcons.moneyWavy,
        paymentMethod: PaymentMethod.delivery,
      ),
    );
    _paymentsList.add(
      PaymentsTypesModel(
        id: '1',
        title: 'Crédito Bancolombia',
        image: 'assets/images/bancolombia.png',
        paymentMethod: PaymentMethod.bancolombia,
      ),
    );
    _paymentsList.add(
      PaymentsTypesModel(
        id: '2',
        title: 'Tranferencia PSE',
        image: 'assets/images/pse.png',
        paymentMethod: PaymentMethod.pse,
      ),
    );
    _paymentsList.add(
      PaymentsTypesModel(
        id: '3',
        title: 'Pago con tarjeta',
        subtitle: 'Tarjeta de Crédito y Débito',
        icon: EstrellasIcons.creditCard,
        paymentMethod: PaymentMethod.card,
      ),
    );

    super.onInit();
  }

  @override
  void onReady() {
    if (userProductController.uniqueProduct != null) {
      showBottomBar.value = true;
    } else {
      showBottomBar.value = userProductController.listProductCart.isNotEmpty;
      // buyMultipleProducts();
    }

    super.onReady();
  }

  void onSelectedPayment(String id) {
    selectedPayment.value = id;
  }

  Future<void> confirmBuy() async {
    if (selectedPayment.value == '0') {
      buy();
    } else {
      goToPayments();
    }
  }

  Future<void> buy() async {
    final result = await Get.toNamed(Routes.FINALIZE_ORDER, arguments: [
      address,
      PaymentMethod.delivery,
    ]);
  }

  Future<void> goToPayments() async {
    final result = await Get.toNamed(Routes.PAYMENTS_METHOD);
  }
}
