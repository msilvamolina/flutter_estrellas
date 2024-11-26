import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_estrellas/app/app/bottom_sheets/modal_bottom_sheet/example_bottomsheet.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/components/bottom_sheets/bottomsheets.dart';
import 'package:flutter_estrellas/app/components/snackbars/snackbars.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/data/models/user_catalog/user_catalog_model.dart';
import 'package:flutter_estrellas/app/data/models/video_model.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/user_products/user_products_repository.dart';
import 'package:flutter_estrellas/app/services/environment.dart';
import 'package:flutter_estrellas/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import '../../components/bottom_sheets/types.dart';
import '../../data/models/request_order/request_order_model.dart';
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
  MainController mainController = Get.find<MainController>();
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

  final RxList<RequestOrderModel> _listRequestOrder = <RequestOrderModel>[].obs;
  List<RequestOrderModel> get listRequestOrder => _listRequestOrder.toList();

  final RxList<UserCatalogModel> _listUserCatalogs = <UserCatalogModel>[].obs;
  List<UserCatalogModel> get listUserCatalogs => _listUserCatalogs.toList();

  UserProductCartModel? _uniqueProduct;
  UserProductCartModel? get uniqueProduct => _uniqueProduct;
  bool _addCatalogIsLoading = false;
  bool get addCatalogIsLoading => _addCatalogIsLoading;

  VideoPostModel? _productCatalogBottomSheet;
  VideoPostModel? get productCatalogBottomSheet => _productCatalogBottomSheet;

  Map<String, int> mapProductsQuantity = {};

  bool addCatalogFormIsSubmitted = false;

  Rx<double> cartPrices = 0.0.obs;
  RxInt cartPoints = 0.obs;
  RxInt cartQuantity = 0.obs;

  bool _shareIsLoading = true;
  bool get shareIsLoading => _shareIsLoading;

  String _shareLink = '';
  String get shareLink => _shareLink;

  String _shareTitle = '';
  String get shareTitle => _shareTitle;

  String _shareLinkTitle = '';
  String get shareLinkTitle => _shareLinkTitle;

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
    fillUserList();
    super.onReady();
  }

  void fillUserList() {
    _listProductCart.bindStream(userProductRepository.getUserCart());
    _listProductFavorites.bindStream(userProductRepository.getUserFavorites());
    _listProductCatalogPrivate
        .bindStream(userProductRepository.getUserCatalogPrivate());
    _listUserCatalogs.bindStream(userProductRepository.getUserCatalogs());
    _listRequestOrder.bindStream(userProductRepository.getListRequestOrders());
  }

  void goToBuyUniqueProduct(VideoPostModel? videoPostModel) {
    mainController
        .actionNeedLogin(() => goToBuyUniqueProductAction(videoPostModel));
  }

  void goToBuyUniqueProductAction(VideoPostModel? videoPostModel) {
    setUniqueProduct(videoPostModel);
    cartPoints.value = videoPostModel?.product?.points ?? 0;
    cartPrices.value = videoPostModel?.product?.price ?? 0;
    cartQuantity.value = 1;
    Get.toNamed(Routes.ADDRESS);
  }

  Future<void> clearCart() async {
    await userProductRepository.clearCart();
  }

  void goToSellProduct(VideoPostModel? videoPostModel) {
    mainController.actionNeedLogin(() => goToSellProductAction(videoPostModel));
  }

  void goToSellProductAction(VideoPostModel? videoPostModel) async {
    if (videoPostModel == null) {
      return;
    }

    _shareTitle = 'Comparte este producto para\nvender';

    _shareIsLoading = true;
    update(['share_bottomsheet']);
    Bottomsheets.staticBottomSheet(BottomSheetTypes.share);

    String id = '';
    RequestOrderModel? requestOrderModel =
        productInRequestOrder(videoPostModel);
    if (requestOrderModel != null) {
      id = requestOrderModel.id;
      _shareLinkTitle = requestOrderModel.title;
      _shareLink = 'https://checkout.${Environment.websiteUrl!}/$id';
    } else {
      id = Utils.generateRandomCode();
      _shareLink = 'https://checkout.${Environment.websiteUrl!}/$id';
      _shareLinkTitle =
          '¡Compra ${videoPostModel.product?.name} en Estrellas! $_shareLink';

      await createSingleProductLink(
        id: id,
        title: _shareLinkTitle,
        imageUrl: videoPostModel.thumbnail,
        videoPostModel: videoPostModel,
      );
    }

    _shareIsLoading = false;
    update(['share_bottomsheet']);
  }

  Future<void> goToSellCatalog(UserCatalogModel userCatalogModel) async {
    _shareTitle = 'Comparte este catálogo para\nvender';

    _shareIsLoading = true;
    update(['share_bottomsheet']);
    Bottomsheets.staticBottomSheet(BottomSheetTypes.share);

    String id = '';
    RequestOrderModel? requestOrderModel = productsCatalogsInRequestOrder(
        userCatalogModel.id, userCatalogModel.videos!);

    if (requestOrderModel != null) {
      id = requestOrderModel.id;
      _shareLinkTitle = requestOrderModel.title;
      _shareLink = 'https://checkout.${Environment.websiteUrl!}/$id';
    } else {
      id = Utils.generateRandomCode();
      _shareLink = 'https://checkout.${Environment.websiteUrl!}/$id';
      _shareLinkTitle =
          'Mira ${userCatalogModel.name} en Estrellas $_shareLink';

      await createCatalogLink(
        id: id,
        title: _shareLinkTitle,
        imageUrl: userCatalogModel.imageUrl,
        list: userCatalogModel.videos ?? [],
        catalogId: userCatalogModel.id,
      );
    }

    _shareIsLoading = false;
    update(['share_bottomsheet']);
  }

  Future<void> goToSellProductsInCatalog({
    required String catalogId,
    required String imageUrl,
    required List<VideoPostModel> list,
  }) async {
    _shareTitle = 'Comparte estos productos para\nvender';

    _shareIsLoading = true;
    update(['share_bottomsheet']);
    Bottomsheets.staticBottomSheet(BottomSheetTypes.share);

    String id = '';
    RequestOrderModel? requestOrderModel =
        productsCatalogsInRequestOrder(catalogId, list);

    if (requestOrderModel != null) {
      id = requestOrderModel.id;
      _shareLinkTitle = requestOrderModel.title;
      _shareLink = 'https://checkout.${Environment.websiteUrl!}/$id';
    } else {
      id = Utils.generateRandomCode();
      _shareLink = 'https://checkout.${Environment.websiteUrl!}/$id';
      _shareLinkTitle = 'Mira estos productos en Estrellas $_shareLink';

      await createCatalogLink(
        id: id,
        title: _shareLinkTitle,
        imageUrl: imageUrl,
        list: list,
        catalogId: catalogId,
      );
    }

    _shareIsLoading = false;
    update(['share_bottomsheet']);
  }

  Future<void> createSingleProductLink({
    required VideoPostModel videoPostModel,
    required String id,
    required String title,
    required String imageUrl,
  }) async {
    Either<String, Unit> response =
        await userProductRepository.createOrderRequest(
      id: id,
      type: 'single_product',
      videoPostModel: videoPostModel,
      title: title,
      imageUrl: imageUrl,
    );

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {},
    );
  }

  Future<void> createCatalogLink({
    required String catalogId,
    required List<VideoPostModel> list,
    required String id,
    required String title,
    required String imageUrl,
  }) async {
    Either<String, Unit> response =
        await userProductRepository.createOrderRequest(
      id: id,
      listVideoPostModel: list,
      type: 'catalog_products',
      catalogId: catalogId,
      title: title,
      imageUrl: imageUrl,
    );

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {},
    );
  }

  void shareCopyLink() {}
  void shareDownload() {}
  void shareWhatsapp() {}
  void shareFacebook() {}
  void shareInstagram() {}

  void setUniqueProduct(VideoPostModel? videoPostModel) {
    if (videoPostModel != null) {
      String id = Uuid().v4();
      UserProductCartModel unique = UserProductCartModel(
        id: id,
        quantity: 1,
        video: videoPostModel,
        price: videoPostModel.product?.price ?? 0,
        suggestedPrice: videoPostModel.product?.suggestedPrice ?? 0,
        points: videoPostModel.product?.points ?? 0,
        stock: videoPostModel.product?.stock ?? 1,
      );
      _uniqueProduct = unique;
    } else {
      _uniqueProduct = null;
    }
  }

  void productFavoriteButton(VideoPostModel videoPostModel) {
    mainController.actionNeedLogin(() => productFavoriteAction(videoPostModel));
  }

  void productFavoriteAction(VideoPostModel videoPostModel) {
    if (isProductInFavorites(videoPostModel)) {
      removeFromFavorites(videoPostModel);
    } else {
      addToFavorites(videoPostModel);
    }
  }

  void productCatalogButton(VideoPostModel videoPostModel) {
    mainController.actionNeedLogin(() => productCatalogAction(videoPostModel));
  }

  void productCatalogAction(VideoPostModel videoPostModel) {
    if (isProductInCatalogPrivate(videoPostModel)) {
      showBottomSheetCatalog(videoPostModel);
    } else {
      onPressedSaveButton(videoPostModel);
    }
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

  Future<void> openAddCatalogBottomSheet({bool productNull = false}) async {
    if (productNull) {
      _productCatalogBottomSheet = null;
    }
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
        videoPostModel: _productCatalogBottomSheet, catalogName: name);

    _addCatalogIsLoading = false;
    Get.back();
    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        String message = 'Guardado en';

        if (_productCatalogBottomSheet?.product != null) {
          Snackbars.productSnackbar(
              _productCatalogBottomSheet!.product!, '$message $name');
        } else {
          Snackbars.success('Se creó un nuevo catálogo');
        }
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

  bool isProductInCart(VideoPostModel? videoPostModel) {
    UserProductCartModel? option = _listProductCart
        .firstWhereOrNull((element) => element.video?.id == videoPostModel?.id);
    return option != null;
  }

  UserProductCartModel? getProductInCart(VideoPostModel? videoPostModel) {
    UserProductCartModel? option = _listProductCart
        .firstWhereOrNull((element) => element.video?.id == videoPostModel?.id);
    return option;
  }

  bool isProductInCatalogPrivate(VideoPostModel? videoPostModel) {
    UserProductModel? option = _listProductCatalogPrivate
        .firstWhereOrNull((element) => element.video?.id == videoPostModel?.id);

    return option != null;
  }

  RequestOrderModel? productInRequestOrder(VideoPostModel? videoPostModel) {
    RequestOrderModel? option = _listRequestOrder.firstWhereOrNull(
      (element) =>
          element.video?.id == videoPostModel?.id &&
          element.type == 'single_product',
    );

    return option;
  }

  RequestOrderModel? productsCatalogsInRequestOrder(
      String catalogId, List<VideoPostModel> list) {
    RequestOrderModel? option = _listRequestOrder.firstWhereOrNull(
      (element) =>
          element.catalogId == catalogId &&
          element.type == 'catalog_products' &&
          element.videos?.length == list.length,
    );

    if (option != null) {
      // Verifica que todos los IDs de element.videos coincidan con los IDs de list
      bool allIdsMatch = option.videos!
          .map((video) => video.id) // Mapea los IDs de element.videos
          .toList()
          .every(
            (id) => list.any((item) => item.id == id),
          ); // Verifica si cada ID está en la lista

      if (!allIdsMatch) {
        return null; // Si hay diferencias, retorna null
      }
    }
    return option;
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
    String? imageUrl = catalog.imageUrl;
    if (add) {
      newlistProducts.add(videoPostModel.toDocument());
      if (imageUrl == null || imageUrl == '') {
        imageUrl = videoPostModel.product?.thumbnail ?? '';
      }
    }

    Either<String, Unit> response =
        await userProductRepository.updateCatalogListProducts(
      catalogId: catalog.id,
      videos: newlistProducts,
      imageUrl: imageUrl,
    );

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
