import 'package:flutter_estrellas/app/data/models/address/address_model.dart';
import 'package:get/get.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../app/controllers/user_product_controller.dart';
import '../../../data/providers/repositories/address/address_repository.dart';

class SelectPaymentController extends GetxController {
  MainController mainController = Get.find();
  UserProductController userProductController =
      Get.find<UserProductController>();

  late AddressModel address;
  @override
  void onInit() {
    address = Get.arguments as AddressModel;
    super.onInit();
  }

  void confirmBuy() {
    print('${userProductController.listProductCart.toList().toString()}');
  }
}
