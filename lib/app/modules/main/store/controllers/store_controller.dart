import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../app/bottom_sheets/delete_catalogs_bottomsheet.dart';
import '../../../../app/bottom_sheets/delete_products_catalog_bottomsheet.dart';
import '../../../../app/controllers/main_controller.dart';
import '../../../../app/controllers/user_product_controller.dart';
import '../../../../components/bottom_sheets/bottomsheets.dart';
import '../../../../components/snackbars/snackbars.dart';
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

  void onProductPressed(UserCatalogModel catalog) {
    if (isProductInCatalog(catalog)) {
      catalogSelectedMap.remove(catalog.id);
    } else {
      catalogSelectedMap[catalog.id] = catalog;
    }

    update(['view']);
  }

  bool isProductInCatalog(UserCatalogModel catalog) {
    UserCatalogModel? catalogSelected = catalogSelectedMap[catalog.id];
    return catalogSelected != null;
  }

  void showDeleteBottomBar() {
    if (catalogSelectedMap.isNotEmpty) {
      Bottomsheets.customBottomSheet(DeleteCatalogsBottomsSheet());
    }
  }

  void onPressedSelectMode() {
    catalogSelectedMap.clear();
    _isSelectMode = !_isSelectMode;
    update(['view']);
  }

  void openAddCatalogBottomSheet() {
    userProductController.openAddCatalogBottomSheet(productNull: true);
  }

  Future<void> deleteProductsInCatalog() async {
    List<UserCatalogModel> listProducts =
        userProductController.listUserCatalogs;

    mainController.showLoader(title: 'Actualizando contenido');

    for (UserCatalogModel element in listProducts) {
      if (isProductInCatalog(element)) {
        await userProductController.userProductRepository.deleteCatalog(
          catalogId: element.id,
        );
      }
    }

    Get.back();
    Snackbars.success('Contenido eliminado con éxito');
  }
}
