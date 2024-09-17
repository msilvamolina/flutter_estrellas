import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  MainController mainController = Get.find();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
