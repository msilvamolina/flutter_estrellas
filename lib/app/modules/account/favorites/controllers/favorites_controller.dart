import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../app/controllers/user_product_controller.dart';

class FavoritesController extends GetxController {
  MainController mainController = Get.find<MainController>();
  UserProductController userProductController =
      Get.find<UserProductController>();
  @override
  void onInit() {
    super.onInit();
  }
}
