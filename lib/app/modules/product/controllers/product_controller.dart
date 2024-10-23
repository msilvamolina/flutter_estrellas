import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  MainController mainController = Get.find();
  final count = 0.obs;

  late ProductFirebaseLiteModel productLite;
  @override
  void onInit() {
    productLite = Get.arguments as ProductFirebaseLiteModel;
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
