import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_estrellas/app/app/bottom_sheets/modal_bottom_sheet/example_bottomsheet.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/components/bottom_sheets/bottomsheets.dart';
import 'package:flutter_estrellas/app/components/snackbars/snackbars.dart';
import 'package:flutter_estrellas/app/data/models/order/order_model.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/data/models/user_catalog/user_catalog_model.dart';
import 'package:flutter_estrellas/app/data/models/video_model.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/products/products_repository.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/user_products/user_products_repository.dart';
import 'package:flutter_estrellas/app/services/environment.dart';
import 'package:flutter_estrellas/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:social_sharing_plus/social_sharing_plus.dart';
import 'package:uuid/uuid.dart';

import '../../components/bottom_sheets/types.dart';
import '../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../data/models/product_variant/product_variant_model.dart';
import '../../data/models/product_variant_attributes/product_variant_attributes.dart';
import '../../data/models/request_order/request_order_model.dart';
import '../../data/models/user_product/user_product_model.dart';
import '../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../data/models/variant_attributte/variant_attributte.dart';
import '../../data/models/variant_info/variant_info.dart';
import '../../data/models/variant_variant/variant_variant.dart';
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
  ProductsRepository productRepository = ProductsRepository();
  final RxList<UserProductCartModel> _listProductCart =
      <UserProductCartModel>[].obs;
  List<UserProductCartModel> get listProductCart => _listProductCart.toList();

  final RxList<OrderModel> _listOrder = <OrderModel>[].obs;
  List<OrderModel> get listOrder => _listOrder.toList();

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
  bool isVariantsLoading = false;
  RxBool isProductVariantsLoading = false.obs;

  bool isVariantsButtonEnabled = false;
  bool isPickVariantButtonLoading = false;
  bool isVariantsButtonAddToCart = false;
  bool isVariantsButtonAddToCartUpdate = false;
  String isVariantsButtonText = '';

  Rx<double> cartPrices = 0.0.obs;
  RxInt cartPoints = 0.obs;
  RxInt cartQuantity = 0.obs;
  Rx<double> cartProfit = 0.0.obs;

  bool _shareIsLoading = true;
  bool get shareIsLoading => _shareIsLoading;

  String _shareLink = '';
  String get shareLink => _shareLink;

  String _shareTitle = '';
  String get shareTitle => _shareTitle;

  String _shareImageUrl = '';
  String get shareImageUrl => _shareImageUrl;

  String _shareLinkTitle = '';
  String get shareLinkTitle => _shareLinkTitle;

  ProductVariantModel? productVariantSelected;
  List<ProductVariantModel>? _listVariantCombinations;
  List<ProductVariantModel>? get listVariantCombinations =>
      _listVariantCombinations;
  List<ProductVariantAttributesModel>? _listAttributes;
  List<ProductVariantAttributesModel>? get listAttributes => _listAttributes;
  VariantInfoModel? variantInfoModel;
  RxMap<String, String> selectedVariantsMap = <String, String>{}.obs;
  RxMap<String, dynamic> selectedVariantsAttributesMap =
      <String, dynamic>{}.obs;
  VideoPostModel? productSelected;
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
    _listOrder.bindStream(userProductRepository.getListOrders());
  }

  void goToBuyUniqueProduct(VideoPostModel? videoPostModel) {
    mainController
        .actionNeedLogin(() => goToBuyUniqueProductAction(videoPostModel));
  }

  void goToBuyUniqueProductAction(VideoPostModel? videoPostModel) {
    isVariantsButtonText = 'Comprar';
    isVariantsButtonAddToCart = false;
    isVariantsButtonAddToCartUpdate = false;
    pickVariants(videoPostModel!);
  }

  void saveBuyActionVariant(
      VideoPostModel videoPostModel, ProductVariantModel variant) {
    setUniqueProduct(videoPostModel);
    cartPoints.value = variant.points ?? 0;
    cartPrices.value = variant.sale_price ?? 0;
    cartProfit.value = (variant.suggested_price ?? 0) - cartPrices.value;
    cartQuantity.value = 1;
    Get.toNamed(Routes.CART_UNIQUE_PRODUCT);
  }

  void saveBuyAction(VideoPostModel? videoPostModel) {
    setUniqueProduct(videoPostModel);
    cartPoints.value = videoPostModel?.product?.points ?? 0;
    cartPrices.value = videoPostModel?.product?.price ?? 0;
    cartProfit.value =
        (videoPostModel?.product?.suggestedPrice ?? 0) - cartPrices.value;
    cartQuantity.value = 1;
    Get.toNamed(Routes.CART_UNIQUE_PRODUCT);
  }

  void addCartQuantity() {
    cartQuantity.value = cartQuantity.value + 1;
    calculateUniqueProducts();
  }

  void minusCartQuantity() {
    cartQuantity.value = cartQuantity.value - 1;
    calculateUniqueProducts();
  }

  void calculateUniqueProducts() {
    cartPrices.value = _uniqueProduct?.price ?? 0;
    cartProfit.value = (_uniqueProduct?.suggestedPrice ?? 0) - cartPrices.value;
    cartPoints.value = _uniqueProduct?.points ?? 0;
    cartPrices.value = cartPrices.value * cartQuantity.value;
    cartProfit.value = cartProfit.value * cartQuantity.value;
    cartPoints.value = cartPoints.value * cartQuantity.value;
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
      _shareImageUrl = requestOrderModel.imageUrl;
    } else {
      id = Utils.generateRandomCode();
      _shareLink = 'https://checkout.${Environment.websiteUrl!}/$id';
      _shareLinkTitle =
          '¡Compra ${videoPostModel.product?.name} en Estrellas! $_shareLink';
      _shareImageUrl = videoPostModel.thumbnail;

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
      _shareImageUrl = requestOrderModel.imageUrl;
    } else {
      id = Utils.generateRandomCode();
      _shareLink = 'https://checkout.${Environment.websiteUrl!}/$id';
      _shareLinkTitle =
          'Mira ${userCatalogModel.name} en Estrellas $_shareLink';
      _shareImageUrl = userCatalogModel.imageUrl;

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
      _shareImageUrl = requestOrderModel.imageUrl;
    } else {
      id = Utils.generateRandomCode();
      _shareLink = 'https://checkout.${Environment.websiteUrl!}/$id';
      _shareLinkTitle = 'Mira estos productos en Estrellas $_shareLink';
      _shareImageUrl = imageUrl;

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
  void shareWhatsapp() => share(SocialPlatform.whatsapp);
  void shareFacebook() => share(SocialPlatform.facebook);
  void shareInstagram() {}

  Future<void> share(SocialPlatform platform) async {
    await SocialSharingPlus.shareToSocialMedia(
      platform,
      _shareLinkTitle,
      isOpenBrowser: true,
      onAppNotInstalled: () {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text('${platform.name.capitalize} is not installed.'),
          ));
      },
    );
  }

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

  void productCartButton(VideoPostModel videoPostModel) {
    mainController.actionNeedLogin(() => productCartAction(videoPostModel));
  }

  void productFavoriteAction(VideoPostModel videoPostModel) {
    if (isProductInFavorites(videoPostModel)) {
      removeFromFavorites(videoPostModel);
    } else {
      addToFavorites(videoPostModel);
    }
  }

  void productCartAction(VideoPostModel videoPostModel) {
    if (isProductInCart(videoPostModel)) {
      removeFromCart(videoPostModel);
    } else {
      addToCart(videoPostModel);
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

  Future<void> openPickProductVariant() async {
    Bottomsheets.staticBottomSheet(BottomSheetTypes.pickProductVariant);
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

  Future<void> addToCart(VideoPostModel videoPostModel) async {
    saveaddToCart(videoPostModel);
    // print('addtocart');
    // isVariantsButtonText = 'Agregar al carrito';
    // isVariantsButtonAddToCart = true;
    // isVariantsButtonAddToCartUpdate = false;
    // pickVariants(videoPostModel);
  }

  Future<void> pickVariantsProduct(
      UserProductCartModel userProductCartModel) async {
    productVariantSelected = null;
    isProductVariantsLoading.value = true;

    openPickProductVariant();

    variantInfoModel = await productRepository
        .getVariantsInfo(userProductCartModel.video?.product?.id ?? '');

    _listVariantCombinations =
        await productRepository.getAllProductVariantsFuture(
            productId: userProductCartModel.video?.product?.id ?? '');

    _listAttributes =
        await productRepository.getAllProductVariantAttributesFuture(
            productId: userProductCartModel.video?.product?.id ?? '');
    buildVariantsMap(userProductCartModel);
    isProductVariantsLoading.value = false;

    update(['pick_product_variant_bottom_sheet']);
  }

  void buildVariantsMap(UserProductCartModel userProductCartModel) {
    selectedVariantsMap.clear();
    selectedVariantsAttributesMap.clear();
    if (userProductCartModel.variantInfo != null) {
      String? _variantId = userProductCartModel.variantInfo['id'];

      if (_listVariantCombinations != null) {
        if (_variantId != null) {
          ProductVariantModel? _variantCombination =
              _listVariantCombinations!.firstWhereOrNull(
            (variant) => variant.id == _variantId,
          );

          if (_variantCombination != null) {
            for (dynamic value in _variantCombination.values) {
              String id = value['id'];
              String attributeName = value['attribute_name'];

              VariantVariantModel variant =
                  getVariationsByAttributeName(attributeName);

              selectedVariantsMap[attributeName] = id;
              selectedVariantsAttributesMap[attributeName] = variant.toJson();
            }
          }
        }
      }
    }
  }

  //  selectedVariantsMap[variant.attributeName] = variant.name;
  // selectedVariantsAttributesMap[variant.attributeName] = variant.toJson();
  // checkVariations();

  void onProductVariantSave() {
    print('test: selectedVariantsMap $selectedVariantsMap');
    print('test: selectedVariantsAttributesMap $selectedVariantsAttributesMap');
  }

  Future<void> pickVariants(VideoPostModel videoPostModel) async {
    productSelected = videoPostModel;
    productVariantSelected = null;
    variantInfoModel = await productRepository
        .getVariantsInfo(videoPostModel.product?.id ?? '');
    isVariantsButtonEnabled = false;
    selectedVariantsMap.clear();
    selectedVariantsAttributesMap.clear();
    _listVariantCombinations = null;
    _listAttributes = null;
    isPickVariantButtonLoading = false;
    if (variantInfoModel != null) {
      isVariantsLoading = true;
      update(['pick_product_variant_bottom_sheet']);
      openPickProductVariant();
      _listVariantCombinations =
          await productRepository.getAllProductVariantsFuture(
              productId: videoPostModel.product?.id ?? '');
      _listAttributes =
          await productRepository.getAllProductVariantAttributesFuture(
              productId: videoPostModel.product?.id ?? '');

      isVariantsLoading = false;
      update(['pick_product_variant_bottom_sheet']);
    } else {
      if (isVariantsButtonAddToCart) {
        saveaddToCart(videoPostModel);
      } else {
        saveBuyAction(videoPostModel);
      }
    }
  }

  void onPickVariantButtonPressed() {
    if (productSelected != null && productVariantSelected != null) {
      if (isVariantsButtonAddToCart) {
        isPickVariantButtonLoading = true;
        update(['pick_product_variant_bottom_sheet']);
        // saveAddToCartVariant(productSelected!, productVariantSelected!);
      } else {
        saveBuyActionVariant(productSelected!, productVariantSelected!);
      }
    }
  }

  VariantVariantModel? getVariationWithName(String name) {
    return variantInfoModel!.variants!.firstWhereOrNull(
      (variant) => variant.name == name,
    );
  }

  VariantVariantModel getVariationsByAttributeName(String attributeName) {
    return variantInfoModel!.variants!
        .where((variant) => variant.attributeName == attributeName)
        .toList()[0];
  }

  List<VariantVariantModel> getVariations(VariantAttributeModel attribute) {
    return variantInfoModel!.variants!
        .where((variant) => variant.attributeId == attribute.id)
        .toList();
  }

  Future<void> onCardPressed(VariantVariantModel variant) async {
    selectedVariantsMap[variant.attributeName] = variant.name;
    selectedVariantsAttributesMap[variant.attributeName] = variant.toJson();
    checkVariations();
  }

  void checkVariations() {
    if (selectedVariantsMap.length == variantInfoModel!.attributes!.length) {
      productVariantSelected = findMatchingCombination();
      if (productVariantSelected != null) {
        isVariantsButtonEnabled = true;
        update(['pick_product_variant_bottom_sheet']);
      }
    }
  }

  ProductVariantModel? findMatchingCombination() {
    return listVariantCombinations?.firstWhereOrNull(
      (combination) {
        return selectedVariantsMap.entries.every((entry) {
          final attribute = entry.key;
          final selectedValue = entry.value;

          return combination.values.any((value) =>
              value['attribute_name']?.toLowerCase() ==
                  attribute.toLowerCase() &&
              value['value']?.toLowerCase() == selectedValue.toLowerCase());
        });
      },
    );
  }

  // Future<void> saveAddToCartVariant(
  //     VideoPostModel videoPostModel, ProductVariantModel variant) async {
  //   Either<String, Unit> response = await userProductRepository.addToCart(
  //     video: videoPostModel,
  //     productVariant: variant,
  //     attributes: selectedVariantsAttributesMap,
  //     quantity: 1,
  //     price: variant.sale_price ?? 0,
  //     suggestedPrice: variant.suggested_price ?? 0,
  //     points: variant.points ?? 0,
  //     stock: variant.stock ?? 0,
  //   );

  //   response.fold(
  //     (failure) {
  //       Snackbars.error(failure);
  //     },
  //     (_) {
  //       Get.back();
  //       update(['product_cart_icon']);
  //       Snackbars.success(
  //           '${videoPostModel.product?.name ?? ''} agregado a tu carrito');
  //     },
  //   );
  // }

  Future<void> saveaddToCart(VideoPostModel videoPostModel) async {
    String? defaultVariantID = videoPostModel.product?.defaultVariantID;
    dynamic defaultVariantInfo = videoPostModel.product?.defaultVariantInfo;

    double price = videoPostModel.product?.price ?? 0;
    double suggestedPrice = videoPostModel.product?.suggestedPrice ?? 0;
    int points = videoPostModel.product?.points ?? 0;
    int stock = videoPostModel.product?.stock ?? 0;

    if (videoPostModel.product?.defaultVariantInfo != null) {
      if (videoPostModel.product?.defaultVariantInfo['sale_price'] != null) {
        price = videoPostModel.product?.defaultVariantInfo['sale_price'];
      }
      if (videoPostModel.product?.defaultVariantInfo['suggested_price'] !=
          null) {
        suggestedPrice =
            videoPostModel.product?.defaultVariantInfo['suggested_price'];
      }
      if (videoPostModel.product?.defaultVariantInfo['points'] != null) {
        points = videoPostModel.product?.defaultVariantInfo['points'];
      }
    }
    Either<String, Unit> response = await userProductRepository.addToCart(
      video: videoPostModel,
      variantID: defaultVariantID ?? '',
      variantInfo: defaultVariantInfo,
      quantity: 1,
      price: price,
      suggestedPrice: suggestedPrice,
      points: points,
      stock: stock,
    );

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        update(['product_cart_icon']);
        Snackbars.success(
            '${videoPostModel.product?.name ?? ''} agregado a tu carrito');
      },
    );
  }

  Future<void> removeFromCart(VideoPostModel videoPostModel) async {
    UserProductCartModel? cart = getProductInCart(videoPostModel);

    if (cart == null) {
      return;
    }
    Either<String, Unit> response =
        await userProductRepository.removeFromCart(cart: cart);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Snackbars.success(
            '${videoPostModel.product?.name ?? ''} removido de tu carrito');

        update(['product_cart_icon']);
      },
    );
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
