import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

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
  late AddressModel address;
  late PaymentMethod paymentMethod;

  var status = Status.loading.obs;
  RxString orderNumber = ''.obs;
  RxString failureMessage = ''.obs;

  @override
  void onInit() {
    address = Get.arguments[0] as AddressModel;
    paymentMethod = Get.arguments[1] as PaymentMethod;

    print('address $address');
    print('paymentMethod $paymentMethod');
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(Duration(seconds: 3), () {
      failureMessage.value = 'asdada';
      status.value = Status.failed;
    });
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
    Either<String, String> response =
        await ordersRepository.createOrder(product: product, address: address);

    await Future.delayed(Duration(seconds: 1));
    Get.back();

    response.fold((failure) {
      failureMessage.value = failure;
      status.value = Status.failed;
    }, (order) {
      orderNumber.value = order;
      status.value = Status.success;
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

    Either<String, String> response = await ordersRepository
        .createMultipleOrder(products: products, address: address);

    response.fold((failure) {
      status.value = Status.failed;
    }, (orderNumber) async {
      await userProductController.clearCart();
      status.value = Status.success;
    });
  }
}
