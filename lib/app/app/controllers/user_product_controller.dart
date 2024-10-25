import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_estrellas/app/app/bottom_sheets/modal_bottom_sheet/example_bottomsheet.dart';
import 'package:flutter_estrellas/app/components/bottom_sheets/bottomsheets.dart';
import 'package:flutter_estrellas/app/components/snackbars/snackbars.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/user_products/user_products_repository.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../components/bottom_sheets/types.dart';
import '../../data/models/user_product/user_product_model.dart';
import '../../routes/app_pages.dart';
import '../../components/bottom_sheets/dragabble_bottom_sheet.dart';

enum Fields {
  addCatalogName('addCatalogName');

  const Fields(this.name);
  final String name;
}

class UserProductController extends GetxController {
  UserProductsRepository userProductRepository = UserProductsRepository();
  final RxList<UserProductModel> _listProductCart = <UserProductModel>[].obs;
  List<UserProductModel> get listProductCart => _listProductCart.toList();

  final RxList<UserProductModel> _listProductFavorites =
      <UserProductModel>[].obs;
  List<UserProductModel> get listProductFavorite =>
      _listProductFavorites.toList();

  UserProductModel? _uniqueProduct;
  UserProductModel? get uniqueProduct => _uniqueProduct;
  bool _addCatalogIsLoading = false;
  bool get addCatalogIsLoading => _addCatalogIsLoading;

  ProductFirebaseLiteModel? _productCatalogBottomSheet;
  ProductFirebaseLiteModel? get productCatalogBottomSheet =>
      _productCatalogBottomSheet;

  FormGroup addCatalogForm() => fb.group(<String, Object>{
        Fields.addCatalogName.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(6),
          ],
        ),
      });

  @override
  void onReady() {
    _listProductCart.bindStream(userProductRepository.getUserCart());
    _listProductFavorites.bindStream(userProductRepository.getUserFavorites());
    super.onReady();
  }

  void goToBuyUniqueProduct(ProductFirebaseLiteModel? productLite) {
    setUniqueProduct(productLite);
    Get.toNamed(Routes.ADDRESS);
  }

  void setUniqueProduct(ProductFirebaseLiteModel? productLite) {
    if (productLite != null) {
      UserProductModel unique = UserProductModel(
        quantity: 1,
        createdBy: 'martin@gmail.com',
        createdByUserId: 'asdasd',
        product: productLite,
      );
      _uniqueProduct = unique;
    } else {
      _uniqueProduct = null;
    }
  }

  Future<void> addToCart(ProductFirebaseLiteModel? productLite) async {
    if (productLite == null) {
      return;
    }
    Either<String, Unit> response =
        await userProductRepository.addToCart(productLite: productLite);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Snackbars.success('${productLite.name} agregado a tu carrito');
      },
    );
  }

  Future<void> addToFavorites(ProductFirebaseLiteModel? productLite) async {
    if (productLite == null) {
      return;
    }
    Either<String, Unit> response =
        await userProductRepository.addToFavorites(productLite: productLite);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Snackbars.success('${productLite.name} agregado a favoritos');
      },
    );
  }

  Future<void> removeFromFavorites(
      ProductFirebaseLiteModel? productLite) async {
    if (productLite == null) {
      return;
    }
    Either<String, Unit> response = await userProductRepository
        .removeFromFavorites(productLite: productLite);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Snackbars.success('${productLite.name} removido de favoritos');
      },
    );
  }

  Future<void> removeFromCart(ProductFirebaseLiteModel? productLite) async {
    if (productLite == null) {
      return;
    }
    Either<String, Unit> response =
        await userProductRepository.removeFromCart(productLite: productLite);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Snackbars.success('${productLite.name} removido de tu carrito');
      },
    );
  }

  Future<void> showBottomSeetCatalog(
      ProductFirebaseLiteModel? productLite) async {
    _productCatalogBottomSheet = productLite;

    Bottomsheets.staticBottomSheet(BottomSheetTypes.newCatalog);
    // Bottomsheets.draggableBottomSheet(BottomSheetTypes.catalog);
  }

  Future<void> sendFormAddCatalog(Map<String, Object?> data) async {
    String name = data[Fields.addCatalogName.name].toString();

    _addCatalogIsLoading = true;
    update(['new_catalog_bottom_sheet']);

    Either<String, Unit> response = await userProductRepository.createCatalog(
        productLite: _productCatalogBottomSheet!, catalogName: name);

    _addCatalogIsLoading = false;
    Get.back();
    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Snackbars.addToCatalog(_productCatalogBottomSheet!, name);
      },
    );
  }
}
