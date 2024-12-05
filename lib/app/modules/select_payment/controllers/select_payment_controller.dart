import 'dart:math';

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

  late int paymentOrderNumber;
  @override
  void onInit() {
    bool showLoan = userProductController.cartPrices.value >= 100000;
    address = Get.arguments as AddressModel;
    paymentOrderNumber = generateRandomNumber(5);

    _paymentsList.add(
      PaymentsTypesModel(
        id: '0',
        title: 'Pago contra entrega',
        icon: EstrellasIcons.moneyWavy,
        paymentMethod: PaymentMethod.delivery,
      ),
    );
    if (showLoan) {
      _paymentsList.add(
        PaymentsTypesModel(
          id: '1',
          title: 'Crédito Bancolombia',
          subtitle: 'Por compras superiores a \$100.000',
          image: 'assets/images/bancolombia.png',
          paymentMethod: PaymentMethod.bancolombia,
        ),
      );
    }
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
    if (!showLoan) {
      _paymentsList.add(
        PaymentsTypesModel(
          id: '1',
          title: 'Crédito Bancolombia',
          subtitle: 'Por compras superiores a \$100.000',
          image: 'assets/images/bancolombia.png',
          paymentMethod: PaymentMethod.bancolombia,
          disabled: true,
        ),
      );
    }

    super.onInit();
  }

  @override
  void onReady() {
    if (userProductController.uniqueProduct != null) {
      showBottomBar.value = true;
    } else {
      showBottomBar.value = userProductController.listProductCart.isNotEmpty;
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
    await Get.toNamed(Routes.FINALIZE_ORDER, arguments: [
      paymentOrderNumber,
      address,
      PaymentMethod.delivery,
    ]);
  }

  String getDescripction() {
    if (userProductController.uniqueProduct != null) {
      return userProductController.uniqueProduct!.video!.product?.name ?? '';
    } else {
      if (userProductController.listProductCart.isNotEmpty) {
        return '${userProductController.listProductCart[0].video?.product?.name ?? ''} +${userProductController.listProductCart.length - 1}';
      }
    }
    return '';
  }

  Future<void> goToPayments() async {
    String description = getDescripction();
    String amount = (userProductController.cartPrices.value).toString();
    String email = mainController.userEmail ?? '';

    await Get.toNamed(Routes.PAYMENTS_METHOD, arguments: [
      paymentOrderNumber,
      address,
      PaymentMethod.delivery,
      description,
      amount,
      email,
    ]);
  }

  int generateRandomNumber(int digits) {
    if (digits <= 0) {
      throw ArgumentError("El número de dígitos debe ser mayor que 0");
    }

    int min =
        pow(10, digits - 1).toInt(); // Valor mínimo, como 10000 para 5 dígitos
    int max =
        pow(10, digits).toInt() - 1; // Valor máximo, como 99999 para 5 dígitos

    Random random = Random();
    return min + random.nextInt(max - min + 1);
  }

  void loanButton() {
    if (userProductController.listProductFavorite.isNotEmpty) {
      Get.toNamed(Routes.FAVORITES);
    } else {
      Get.back();
      Get.back();
      Get.back();
    }
  }
}
