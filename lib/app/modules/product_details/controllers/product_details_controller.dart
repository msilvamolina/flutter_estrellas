import 'package:dartz/dartz.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/product/product/product.dart';
import 'package:flutter_estrellas/app/data/models/product/product_firebase/product_firebase_model.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/products/products_repository.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/user_products/user_products_repository.dart';
import 'package:get/get.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../app/controllers/user_product_controller.dart';
import '../../../components/snackbars/snackbars.dart';
import '../../../data/models/product_firebase_lite/product_firebase_lite.dart';
import '../../../data/models/product_image/product_image_model.dart';
import '../../../data/models/product_variant/product_variant_model.dart';
import '../../../data/models/product_variant_combination/product_variant_combination_model.dart';
import '../../../data/models/videos/video_post_model.dart';

class ProductDetailsController extends GetxController {
  MainController mainController = Get.find<MainController>();
  final ProductsRepository _repository = ProductsRepository();
  final UserProductsRepository _userProductsRepository =
      UserProductsRepository();
  UserProductController userProductController =
      Get.find<UserProductController>();

  late VideoPostModel videoPostModel;

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

  ProductVariantCombinationModel? _productVariantCombination;

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

  int _quantity = 1;
  int get quantity => _quantity;

  int _points = 0;
  int get points => _points;
  @override
  void onInit() {
    videoPostModel = Get.arguments as VideoPostModel;
    productLite = videoPostModel.product!;
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
    _stock = productLite.stock ?? 1;
    _quantity = 1;
    update(['product_price', 'content_product', 'product_quantity']);
  }

  Future<void> addToCart() async {
    Either<String, Unit> response = await _userProductsRepository.addToCart(
      video: videoPostModel,
      productVariantCombination: _productVariantCombination,
      quantity: quantity,
      price: _price,
      suggestedPrice: _suggestedPrice,
      points: _points,
      stock: _stock,
    );

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Snackbars.success('${productLite.name ?? ''} agregado a tu carrito');
      },
    );
  }

  void addQuantity() {
    int _newQuantity = _quantity + 1;
    _quantity = _newQuantity > _stock ? _stock : _newQuantity;
    update(['product_quantity']);
  }

  void minusQuantity() {
    int _newQuantity = _quantity - 1;
    _quantity = _newQuantity < 1 ? 1 : _newQuantity;
    update(['product_quantity']);
  }

  ProductVariantCombinationModel? getBySizeAndColor(
      String? sizeId, String? colorId) {
    ProductVariantCombinationModel? option = _listCombination.firstWhereOrNull(
        (element) => element.sizeId == sizeId && element.colorId == colorId);

    return option;
  }

  void buildVariationPrice() {
    _productVariantCombination = getBySizeAndColor(
        _userProductVariantSize?.id, _userProductVariantColor?.id);

    if (_productVariantCombination != null) {
      _price = _productVariantCombination!.price ?? 0;
      _suggestedPrice = _productVariantCombination!.suggestedPrice ?? 0;
      _points = _productVariantCombination!.points ?? 0;
      _stock = _productVariantCombination!.stock ?? 1;
      _quantity = 1;
      update(['product_price', 'content_product', 'product_quantity']);
    } else {
      resetPrice();
    }
  }

  void setFirstProductVariationCombination() {
    _productVariantCombination = getBySizeAndColor(
        _userProductVariantSize?.id, _userProductVariantColor?.id);
  }

  void setFirstVariantColor(ProductVariantModel value) {
    if (_userProductVariantColor == null) {
      _userProductVariantColor = value;
      setFirstProductVariationCombination();

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
      setFirstProductVariationCombination();

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
