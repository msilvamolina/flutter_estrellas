import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import '../controllers/user_product_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}
