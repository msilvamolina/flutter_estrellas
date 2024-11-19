import 'package:get/get.dart';

import '../../../components/bottom_sheets/bottomsheets.dart';
import '../../../components/bottom_sheets/types.dart';
import '../../../data/models/user_catalog/user_catalog_model.dart';
import '../../../data/models/videos/video_post_model.dart';

class CatalogDetailsController extends GetxController {
  //TODO: Implement CatalogDetailsController

  late UserCatalogModel catalogModel;

  bool _isSelectMode = false;
  bool get isSelectMode => _isSelectMode;

  Map<String, VideoPostModel?> catalogSelectedMap = {};
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
    catalogSelectedMap.clear();
    _isSelectMode = !_isSelectMode;
    update(['view']);
  }

  bool isProductInCatalog(VideoPostModel catalog) {
    VideoPostModel? catalogSelected = catalogSelectedMap[catalog.id];
    return catalogSelected != null;
  }

  void onProductPressed(VideoPostModel catalog) {
    if (isProductInCatalog(catalog)) {
      catalogSelectedMap.remove(catalog.id);
    } else {
      catalogSelectedMap[catalog.id] = catalog;
    }

    update(['view']);
  }

  void showDeleteBottomBar() {
    Bottomsheets.staticBottomSheet(BottomSheetTypes.deleteProductsInCatalog);
  }

  void deleteProductsInCatalog() {
    print('deleteProductsInCatalog');
  }
}
