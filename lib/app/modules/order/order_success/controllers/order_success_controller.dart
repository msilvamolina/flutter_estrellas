import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../app/controllers/user_product_controller.dart';

class OrderSuccessController extends GetxController {
  MainController mainController = Get.find();

  late String orderNumber;
  @override
  void onInit() {
    orderNumber = Get.arguments as String;
    super.onInit();
  }
}
