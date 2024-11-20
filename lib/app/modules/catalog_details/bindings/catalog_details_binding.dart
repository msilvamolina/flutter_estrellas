import 'package:get/get.dart';

import '../controllers/catalog_details_controller.dart';

class CatalogDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatalogDetailsController>(
      () => CatalogDetailsController(),
    );
  }
}
