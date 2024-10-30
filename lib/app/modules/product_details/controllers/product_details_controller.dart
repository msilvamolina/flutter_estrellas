import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/product/product/product.dart';
import 'package:flutter_estrellas/app/data/models/product/product_firebase/product_firebase_model.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/products/products_repository.dart';
import 'package:get/get.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../app/controllers/user_product_controller.dart';
import '../../../data/models/product_firebase_lite/product_firebase_lite.dart';
import '../../../data/models/product_image/product_image_model.dart';
import '../../../data/models/product_variant/product_variant_model.dart';
import '../../../data/models/product_variant_combination/product_variant_combination_model.dart';

class ProductDetailsController extends GetxController {
  MainController mainController = Get.find<MainController>();
  final ProductsRepository _repository = ProductsRepository();
  UserProductController userProductController =
      Get.find<UserProductController>();

  late ProductFirebaseLiteModel productLite;
  Rxn<ProductFirebaseModel> product = Rxn<ProductFirebaseModel>();

  final RxList<ProductImageModel> _listImages = <ProductImageModel>[].obs;
  List<ProductImageModel> get listImages => _listImages.toList();

  final RxList<ProductVariantCombinationModel> _listCombination =
      <ProductVariantCombinationModel>[].obs;
  List<ProductVariantCombinationModel> get listCombination =>
      _listCombination.toList();
  List<String> _newOrderList = [];
  final RxList<ProductVariantModel> sizeList = <ProductVariantModel>[].obs;
  final RxList<ProductVariantModel> colorList = <ProductVariantModel>[].obs;

  final RxList<ProductVariantModel> _listVariants = <ProductVariantModel>[].obs;
  List<ProductVariantModel> get listVariants => _listVariants.toList();

  ProductVariantModel? _userProductVariantColor;
  ProductVariantModel? get userProductVariantColor => _userProductVariantColor;

  ProductVariantModel? _userProductVariantSize;
  ProductVariantModel? get userProductVariantSize => _userProductVariantSize;

  bool _isLiked = true;
  bool get isLiked => _isLiked;

  bool _isInCart = true;
  bool get isInCart => _isInCart;

  double _price = 0;
  double get price => _price;

  double _suggestedPrice = 0;
  double get suggestedPrice => _suggestedPrice;

  int _stock = 0;
  int get stock => _stock;

  int _points = 0;
  int get points => _points;
  @override
  void onInit() {
    productLite = Get.arguments as ProductFirebaseLiteModel;
    product.bindStream(_repository.getProduct(productId: productLite.id));
    _listImages
        .bindStream(_repository.getProductImages(productId: productLite.id));
    _listVariants.bindStream(_repository.getAllProductVariants(
      productId: productLite.id,
    ));
    _listCombination.bindStream(_repository.getAllProductVariantsCombinations(
      productId: productLite.id,
    ));

    resetPrice();
    super.onInit();
  }

  void resetPrice() {
    _price = productLite.price ?? 0;
    _suggestedPrice = productLite.suggestedPrice ?? 0;
    _points = productLite.points ?? 0;
    _stock = 1;
    update(['product_price', 'content_product']);
  }

  ProductVariantCombinationModel? getBySizeAndColor(
      String? sizeId, String? colorId) {
    ProductVariantCombinationModel? option = _listCombination.firstWhereOrNull(
        (element) => element.sizeId == sizeId && element.colorId == colorId);

    return option;
  }

  void buildVariationPrice() {
    ProductVariantCombinationModel? combinationModel = getBySizeAndColor(
        _userProductVariantSize?.id, _userProductVariantColor?.id);

    if (combinationModel != null) {
      _price = combinationModel.price ?? 0;
      _suggestedPrice = combinationModel.suggestedPrice ?? 0;
      _points = combinationModel.points ?? 0;
      _stock = combinationModel.stock ?? 1;
      update(['product_price', 'content_product']);
    } else {
      resetPrice();
    }
  }

  void setFirstVariantColor(ProductVariantModel value) {
    if (_userProductVariantColor == null) {
      _userProductVariantColor = value;
      update(['product_variant_color']);
    }
  }

  void chooseColorVariant(ProductVariantModel value) {
    _userProductVariantColor = value;
    update(['product_variant_color']);
    buildVariationPrice();
  }

  void setFirstVariantSize(ProductVariantModel value) {
    if (_userProductVariantSize == null) {
      _userProductVariantSize = value;
      update(['product_variant_size']);
    }
  }

  void chooseSizeVariant(ProductVariantModel value) {
    _userProductVariantSize = value;
    Get.back();
    update(['product_variant_size']);
    buildVariationPrice();
  }

  void openPhotoView() {
    MultiImageProvider multiImageProvider = MultiImageProvider([
      NetworkImage(productLite.thumbnail ?? ''),
      if (_listImages.isNotEmpty)
        for (ProductImageModel image in _listImages)
          NetworkImage(image.imageUrl),
    ]);

    showImageViewerPager(Get.context!, multiImageProvider,
        onPageChanged: (page) {
      // print("page changed to $page");
    }, onViewerDismissed: (page) {
      // print("dismissed while on page $page");
    });
  }
}
