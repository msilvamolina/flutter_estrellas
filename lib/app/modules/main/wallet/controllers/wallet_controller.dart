import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  MainController mainController = Get.find<MainController>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    if (mainController.userData == null) {
      print('mostrar bottomsheet');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
