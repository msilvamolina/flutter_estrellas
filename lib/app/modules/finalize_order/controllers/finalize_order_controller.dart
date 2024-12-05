import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../app/controllers/user_product_controller.dart';
import '../../../data/models/address/address_model.dart';
import '../../../data/models/payments_types/payments_types_model.dart';
import '../../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../../data/providers/repositories/orders/orders_repository.dart';
import '../../../routes/app_pages.dart';

enum Status {
  loading,
  failed,
  pending,
  success,
}

class FinalizeOrderController extends GetxController {
  MainController mainController = Get.find();
  UserProductController userProductController =
      Get.find<UserProductController>();
  OrdersRepository ordersRepository = OrdersRepository();
  late int paymentOrderNumber;
  late AddressModel address;
  late PaymentMethod paymentMethod;

  var status = Status.loading.obs;
  RxString orderNumber = ''.obs;
  RxString failureMessage = ''.obs;

  String orderId = Uuid().v4();
  @override
  void onInit() {
    paymentOrderNumber = Get.arguments[0] as int;
    address = Get.arguments[1] as AddressModel;
    paymentMethod = Get.arguments[2] as PaymentMethod;
    super.onInit();
  }

  @override
  void onReady() {
    buy();
    super.onReady();
  }

  void buy() {
    if (userProductController.uniqueProduct != null) {
      buyUniqueProducts(userProductController.uniqueProduct!);
    } else {
      buyMultipleProducts();
    }
  }

  void buyUniqueProducts(UserProductCartModel product) async {
    Either<String, String> response = await ordersRepository.createOrder(
      id: orderId,
      product: product,
      address: address,
      paymentMethod: paymentMethod,
      paymentOrderNumber: paymentOrderNumber,
    );

    response.fold((failure) {
      failureMessage.value = failure;
      status.value = Status.failed;
    }, (order) {
      saveOrder(order);
    });
  }

  void saveOrder(String _) async {
    String order = '2860064';

    Either<String, Unit> response =
        await ordersRepository.saveOrder(orderNumber: order, id: orderId);

    response.fold((failure) {
      failureMessage.value = failure;
      status.value = Status.failed;
    }, (_) {
      orderNumber.value = order;
      status.value = paymentMethod == PaymentMethod.delivery
          ? Status.success
          : Status.pending;
    });
  }

  void buyMultipleProducts() async {
    List<dynamic> products = [];
    List<dynamic> productsDocuments = [];

    if (userProductController.listProductCart.isNotEmpty) {
      for (UserProductCartModel element
          in userProductController.listProductCart) {
        productsDocuments.add(element.toDocument());
        products.add(
          {
            "product_id": element.video!.product!.id,
            "client_quantity": element.quantity ?? 1,
            "variation_id": ""
          },
        );
      }
    }

    Either<String, String> response =
        await ordersRepository.createMultipleOrder(
      id: orderId,
      products: products,
      productsDocuments: productsDocuments,
      address: address,
      paymentMethod: paymentMethod,
      paymentOrderNumber: paymentOrderNumber,
    );

    response.fold((failure) {
      failureMessage.value = failure;
      status.value = Status.failed;
    }, (order) async {
      await userProductController.clearCart();
      saveOrder(order);
    });
  }
}
