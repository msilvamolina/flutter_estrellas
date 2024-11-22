import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../app/controllers/user_product_controller.dart';
import '../../../../data/models/user_catalog/user_catalog_model.dart';

class StoreController extends GetxController {
  MainController mainController = Get.find<MainController>();
  UserProductController userProductController =
      Get.find<UserProductController>();

  bool _isSelectMode = false;
  bool get isSelectMode => _isSelectMode;

  Map<String, UserCatalogModel?> catalogSelectedMap = {};

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

  void onPressedSelectMode() {
    catalogSelectedMap.clear();
    _isSelectMode = !_isSelectMode;
    update(['view']);
  }

  void openAddCatalogBottomSheet() {
    userProductController.openAddCatalogBottomSheet(productNull: true);
  }
}
