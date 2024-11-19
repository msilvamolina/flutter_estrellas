import 'package:get/get.dart';

import '../../../data/models/user_catalog/user_catalog_model.dart';

class CatalogDetailsController extends GetxController {
  //TODO: Implement CatalogDetailsController

  late UserCatalogModel catalogModel;

  bool _isSelectMode = false;
  bool get isSelectMode => _isSelectMode;
  @override
  void onInit() {
    catalogModel = Get.arguments as UserCatalogModel;
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
    _isSelectMode = !_isSelectMode;
    update(['view']);
  }
}
