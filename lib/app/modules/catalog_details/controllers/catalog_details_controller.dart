import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:get/get.dart';

import '../../../components/bottom_sheets/bottomsheets.dart';
import '../../../components/bottom_sheets/types.dart';
import '../../../components/snackbars/snackbars.dart';
import '../../../data/models/user_catalog/user_catalog_model.dart';
import '../../../data/models/videos/video_post_model.dart';

class CatalogDetailsController extends GetxController {
  MainController mainController = Get.find<MainController>();

  UserProductController userProductController =
      Get.find<UserProductController>();

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
    if (catalogSelectedMap.isNotEmpty) {
      Bottomsheets.staticBottomSheet(BottomSheetTypes.deleteProductsInCatalog);
    }
  }

  Future<void> deleteProductsInCatalog() async {
    List<VideoPostModel> listProducts = catalogModel.videos ?? [];

    List<dynamic> newlistProducts = [];

    for (VideoPostModel element in listProducts) {
      if (!isProductInCatalog(element)) {
        newlistProducts.add(element.toDocument());
      }
    }
    String? imageUrl = catalogModel.imageUrl;
    if (newlistProducts.isEmpty) {
      imageUrl = '';
    }

    mainController.showLoader(title: 'Actualizando catálogo');

    Either<String, Unit> response = await userProductController
        .userProductRepository
        .updateCatalogListProducts(
      catalogId: catalogModel.id,
      videos: newlistProducts,
      imageUrl: imageUrl!,
    );

    Get.back();
    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Get.back();
        Snackbars.success('Tu catalago fue actualizado');
      },
    );
  }
}
