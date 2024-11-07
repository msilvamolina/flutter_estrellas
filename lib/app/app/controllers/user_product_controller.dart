import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_estrellas/app/app/bottom_sheets/modal_bottom_sheet/example_bottomsheet.dart';
import 'package:flutter_estrellas/app/components/bottom_sheets/bottomsheets.dart';
import 'package:flutter_estrellas/app/components/snackbars/snackbars.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/data/models/user_catalog/user_catalog_model.dart';
import 'package:flutter_estrellas/app/data/models/video_model.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/user_products/user_products_repository.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../components/bottom_sheets/types.dart';
import '../../data/models/user_product/user_product_model.dart';
import '../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../data/models/videos/video_post_model.dart';
import '../../routes/app_pages.dart';
import '../../components/bottom_sheets/dragabble_bottom_sheet.dart';

enum Fields {
  addCatalogName('addCatalogName');

  const Fields(this.name);
  final String name;
}

class UserProductController extends GetxController {
  UserProductsRepository userProductRepository = UserProductsRepository();
  final RxList<UserProductCartModel> _listProductCart =
      <UserProductCartModel>[].obs;
  List<UserProductCartModel> get listProductCart => _listProductCart.toList();

  final RxList<UserProductModel> _listProductFavorites =
      <UserProductModel>[].obs;
  List<UserProductModel> get listProductFavorite =>
      _listProductFavorites.toList();

  final RxList<UserProductModel> _listProductCatalogPrivate =
      <UserProductModel>[].obs;
  List<UserProductModel> get listProductCatalogPrivate =>
      _listProductCatalogPrivate.toList();

  final RxList<UserCatalogModel> _listUserCatalogs = <UserCatalogModel>[].obs;
  List<UserCatalogModel> get listUserCatalogs => _listUserCatalogs.toList();

  UserProductModel? _uniqueProduct;
  UserProductModel? get uniqueProduct => _uniqueProduct;
  bool _addCatalogIsLoading = false;
  bool get addCatalogIsLoading => _addCatalogIsLoading;

  VideoPostModel? _productCatalogBottomSheet;
  VideoPostModel? get productCatalogBottomSheet => _productCatalogBottomSheet;

  bool addCatalogFormIsSubmitted = false;

  FormGroup addCatalogForm() => fb.group(<String, Object>{
        Fields.addCatalogName.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
      });

  @override
  void onReady() {
    _listProductCart.bindStream(userProductRepository.getUserCart());
    _listProductFavorites.bindStream(userProductRepository.getUserFavorites());
    _listProductCatalogPrivate
        .bindStream(userProductRepository.getUserCatalogPrivate());
    _listUserCatalogs.bindStream(userProductRepository.getUserCatalogs());
    super.onReady();
  }

  void goToBuyUniqueProduct(VideoPostModel? videoPostModel) {
    setUniqueProduct(videoPostModel);
    Get.toNamed(Routes.ADDRESS);
  }

  void setUniqueProduct(VideoPostModel? videoPostModel) {
    //   if (videoPostModel != null) {
    //     UserProductModel unique = UserProductModel(
    //       quantity: 1,
    //       createdBy: 'martin@gmail.com',
    //       createdByUserId: 'asdasd',
    //       video: videoPostModel,
    //     );
    //     _uniqueProduct = unique;
    //   } else {
    //     _uniqueProduct = null;
    //   }
  }

  Future<void> addToFavorites(VideoPostModel? videoPostModel) async {
    if (videoPostModel == null) {
      return;
    }
    Either<String, Unit> response = await userProductRepository.addToFavorites(
        videoPostModel: videoPostModel);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        String message = 'agregado en a tus favoritos';
        Snackbars.productSnackbar(videoPostModel.product!,
            '${videoPostModel.product!.name} $message');
        update(['product_favorite_icon']);
      },
    );
  }

  Future<void> removeFromFavorites(VideoPostModel? videoPostModel) async {
    if (videoPostModel == null) {
      return;
    }
    Either<String, Unit> response = await userProductRepository
        .removeFromFavorites(videoPostModel: videoPostModel);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        String message = 'removido de tus favoritos';
        Snackbars.productSnackbar(videoPostModel.product!,
            '${videoPostModel.product!.name} $message');
        update(['product_favorite_icon']);
      },
    );
  }

  Future<void> addToCatalogPrivate(
      VideoPostModel? videoPostModel, bool openBottomSheet) async {
    if (videoPostModel == null) {
      return;
    }
    Either<String, Unit> response = await userProductRepository
        .addToCatalogPrivate(videoPostModel: videoPostModel);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        if (openBottomSheet) {
          showBottomSheetCatalog(videoPostModel);
        }
        update(['product_catalog_icon']);
      },
    );
  }

  Future<void> removeFromCatalogPrivate(VideoPostModel? videoPostModel) async {
    if (videoPostModel == null) {
      return;
    }
    Either<String, Unit> response = await userProductRepository
        .removeFromCatalogPrivate(videoPostModel: videoPostModel);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Get.back();
        String message = 'removido de tu catálogo privado';
        Snackbars.productSnackbar(videoPostModel!.product!,
            '${videoPostModel.product!.name} $message');
        update(['product_catalog_icon']);
      },
    );
  }

  Future<void> removeFromCart(VideoPostModel? video) async {
    if (video == null) {
      return;
    }
    Either<String, Unit> response =
        await userProductRepository.removeFromCart(video: video);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Snackbars.success('${video.product!.name} removido de tu carrito');
      },
    );
  }

  Future<void> onPressedSaveButton(VideoPostModel? videoPostModel,
      {bool openBottomSheet = true}) async {
    addToCatalogPrivate(videoPostModel, openBottomSheet);
  }

  Future<void> showBottomSheetCatalog(VideoPostModel? videoPostModel) async {
    _productCatalogBottomSheet = videoPostModel;

    if (_listUserCatalogs.isEmpty) {
      openAddCatalogBottomSheet();
    } else {
      double initialChildSize = 0.4;
      double maxChildSize = 0.9;
      double minChildSize = 0.3;

      if (_listUserCatalogs.length == 1) {
        initialChildSize = 0.4;
        maxChildSize = initialChildSize;
        minChildSize = initialChildSize;
      }
      if (_listUserCatalogs.length == 2) {
        initialChildSize = 0.5;
        maxChildSize = initialChildSize;
        minChildSize = initialChildSize;
      }
      if (_listUserCatalogs.length == 3) {
        initialChildSize = 0.56;
        maxChildSize = initialChildSize;
        minChildSize = initialChildSize;
      }
      if (_listUserCatalogs.length == 4) {
        initialChildSize = 0.67;
        maxChildSize = initialChildSize;
        minChildSize = initialChildSize;
      }
      if (_listUserCatalogs.length > 4) {
        initialChildSize = 0.67;
        maxChildSize = 0.9;
        minChildSize = 0.4;
      }
      Bottomsheets.draggableBottomSheet(
        type: BottomSheetTypes.catalog,
        initialChildSize: initialChildSize,
        maxChildSize: maxChildSize,
        minChildSize: minChildSize,
      );
    }
  }

  Future<void> closeAndOpenCreateCatalog() async {
    Get.back();
    openAddCatalogBottomSheet();
  }

  Future<void> openAddCatalogBottomSheet() async {
    addCatalogFormIsSubmitted = false;
    update(['add_catalog_inputs']);
    Bottomsheets.staticBottomSheet(BottomSheetTypes.newCatalog);
  }

  Future<void> onPressedAddCatalog(form) async {
    if (form.valid) {
      return sendFormAddCatalog(form.value);
    } else {
      addCatalogFormIsSubmitted = true;
      form.markAllAsTouched();
      update(['add_catalog_inputs']);
    }
  }

  Future<void> sendFormAddCatalog(Map<String, Object?> data) async {
    String name = data[Fields.addCatalogName.name].toString();

    _addCatalogIsLoading = true;
    update(['new_catalog_bottom_sheet']);

    Either<String, Unit> response = await userProductRepository.createCatalog(
        videoPostModel: _productCatalogBottomSheet!, catalogName: name);

    _addCatalogIsLoading = false;
    Get.back();
    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        String message = 'Guardado en';
        Snackbars.productSnackbar(
            _productCatalogBottomSheet!.product!, '$message $name');
      },
    );
  }

  bool isProductoInCatalog(
      UserCatalogModel catalog, VideoPostModel videoPostModel) {
    List<VideoPostModel> listProducts = catalog.videos ?? [];

    VideoPostModel? option = listProducts
        .firstWhereOrNull((element) => element.id == videoPostModel.id);

    return option != null;
  }

  bool isProductInFavorites(VideoPostModel? videoPostModel) {
    UserProductModel? option = _listProductFavorites
        .firstWhereOrNull((element) => element.video?.id == videoPostModel?.id);

    return option != null;
  }

  bool isProductInCatalogPrivate(VideoPostModel? videoPostModel) {
    UserProductModel? option = _listProductCatalogPrivate
        .firstWhereOrNull((element) => element.video?.id == videoPostModel?.id);

    return option != null;
  }

  Future<void> addProductToCatalog(
      UserCatalogModel catalog, VideoPostModel videoPostModel, bool add) async {
    List<VideoPostModel> listProducts = catalog.videos ?? [];

    List<dynamic> newlistProducts = [];

    for (VideoPostModel element in listProducts) {
      if (element.id != videoPostModel.id) {
        newlistProducts.add(element.toDocument());
      }
    }

    if (add) {
      newlistProducts.add(videoPostModel.toDocument());
    }

    Either<String, Unit> response =
        await userProductRepository.updateCatalogListProducts(
            catalogId: catalog.id, videos: newlistProducts);

    Get.back();
    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        String message = add ? 'Guardado en' : 'Removido de';
        Snackbars.productSnackbar(
            _productCatalogBottomSheet!.product!, '$message ${catalog.name}');
      },
    );
  }
}
