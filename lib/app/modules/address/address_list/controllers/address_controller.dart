import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../app/controllers/user_product_controller.dart';

class AddressController extends GetxController {
  MainController mainController = Get.find();
  UserProductController userProductController =
      Get.find<UserProductController>();
}
