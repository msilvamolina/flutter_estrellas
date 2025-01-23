import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/product/product/product.dart';
import 'package:flutter_estrellas/app/data/models/product/product_firebase/product_firebase_model.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/products/products_repository.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/user_products/user_products_repository.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:get/get.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../app/controllers/user_product_controller.dart';
import '../../../components/snackbars/snackbars.dart';
import '../../../data/models/product_firebase_lite/product_firebase_lite.dart';
import '../../../data/models/product_image/product_image_model.dart';
import '../../../data/models/product_variant/product_variant_model.dart';
import '../../../data/models/product_variant_attributes/product_variant_attributes.dart';
import '../../../data/models/product_variant_combination/product_variant_combination_model.dart';
import '../../../data/models/product_variant_info/product_variant_info_model.dart';
import '../../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../../data/models/variant_attributte/variant_attributte.dart';
import '../../../data/models/variant_info/variant_info.dart';
import '../../../data/models/variant_variant/variant_variant.dart';
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

  ProductFirebaseModel? product;
  RxBool isLoading = true.obs;

  // Rxn<ProductFirebaseModel> product = Rxn<ProductFirebaseModel>();

  final RxList<ProductImageModel> _listImages = <ProductImageModel>[].obs;
  List<ProductImageModel> get listImages => _listImages.toList();

  List<String> _newOrderList = [];
  final RxList<ProductVariantModel> sizeList = <ProductVariantModel>[].obs;
  final RxList<ProductVariantModel> colorList = <ProductVariantModel>[].obs;

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

  final QuillController descriptionController = QuillController(
    document: Document(),
    readOnly: true,
    selection: const TextSelection.collapsed(offset: 0),
  );
  final FocusNode descriptionEditorFocusNode = FocusNode();
  final ScrollController descriptionEditorScrollController = ScrollController();

  final QuillController detailsController = QuillController(
    document: Document(),
    readOnly: true,
    selection: const TextSelection.collapsed(offset: 0),
  );
  final FocusNode detailsEditorFocusNode = FocusNode();
  final ScrollController detailsEditorScrollController = ScrollController();

  final QuillController warrantyController = QuillController(
    document: Document(),
    readOnly: true,
    selection: const TextSelection.collapsed(offset: 0),
  );
  final FocusNode warrantyEditorFocusNode = FocusNode();
  final ScrollController warrantyEditorScrollController = ScrollController();

  final RxList<ProductVariantModel> _listVariantCombinations =
      <ProductVariantModel>[].obs;
  List<ProductVariantModel> get listVariantCombinations =>
      _listVariantCombinations.toList();
  final RxList<ProductVariantAttributesModel> _listAttributes =
      <ProductVariantAttributesModel>[].obs;
  List<ProductVariantAttributesModel> get listAttributes =>
      _listAttributes.toList();
  VariantInfoModel? variantInfoModel;
  RxMap<String, String> selectedVariantsMap = <String, String>{}.obs;
  RxMap<String, dynamic> selectedVariantsAttributesMap =
      <String, dynamic>{}.obs;
  ProductVariantModel? productVariant;

  ProductVariantModel? productVariantSelected;
  ProductVariantModel? productVariantDefault;
  @override
  Future<void> onInit() async {
    videoPostModel = Get.arguments as VideoPostModel;
    productLite = videoPostModel.product!;
    product = await _repository.getProduct(productId: productLite.id);

    _listImages
        .bindStream(_repository.getProductImages(productId: productLite.id));
    _listVariantCombinations.bindStream(
        _repository.getAllProductVariants(productId: productLite!.id));
    _listAttributes.bindStream(
        _repository.getAllProductVariantAttributes(productId: productLite!.id));

    if (product?.descriptionFormatted != null) {
      final descriptionDelta =
          Delta.fromJson(jsonDecode(product?.descriptionFormatted));
      descriptionController.document = Document.fromDelta(descriptionDelta);
    }

    if (product?.detailsFormatted != null) {
      final detailsDelta =
          Delta.fromJson(jsonDecode(product?.detailsFormatted));
      detailsController.document = Document.fromDelta(detailsDelta);
    }

    if (product?.warrantyFormatted != null) {
      final warrantyDelta =
          Delta.fromJson(jsonDecode(product?.warrantyFormatted));
      warrantyController.document = Document.fromDelta(warrantyDelta);
    }

    resetPrice();
    update(['view']);

    ever<List<ProductVariantModel>>(_listVariantCombinations, (list) async {
      await loadInfo();
      buildVariantsMap();
    });

    super.onInit();
  }

  void buildVariantsMap() {
    selectedVariantsMap.clear();
    selectedVariantsAttributesMap.clear();

    if (videoPostModel.product?.defaultVariantInfo != null) {
      String? variantId = videoPostModel.product?.defaultVariantInfo?.id;
      variantId ??= videoPostModel.product?.defaultVariantInfo?.id0;

      if (_listVariantCombinations != null) {
        if (variantId != null) {
          ProductVariantModel? variantCombination =
              _listVariantCombinations.firstWhereOrNull(
            (variant) => variant.id == variantId,
          );

          if (variantCombination != null) {
            for (dynamic value in variantCombination.values) {
              String id = value['id'];
              String attributeName = value['attribute_name'];

              VariantVariantModel variant =
                  getVariationsByAttributeName(attributeName);

              selectedVariantsMap[attributeName] = id;
              selectedVariantsAttributesMap[attributeName] = variant.toJson();
            }
          }

          productVariantDefault = findMatchingCombination();
          productVariantSelected = productVariantDefault;
          checkVariations();
        }
      }
    }
    update(['view']);
  }

  VariantVariantModel getVariationsByAttributeName(String attributeName) {
    return variantInfoModel!.variants!
        .where((variant) => variant.attributeName == attributeName)
        .toList()[0];
  }

  Future<void> loadInfo() async {
    variantInfoModel = await _repository.getVariantsInfo(product!.id);
    isLoading.value = false;
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
    dynamic variantInfo = productVariantSelected!.toJson();
    String variantID = (productVariantSelected?.externalID ?? '').toString();

    Either<String, Unit> response = await _userProductsRepository.addToCart(
      video: videoPostModel,
      variantID: variantID,
      variantInfo: variantInfo,
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
        update(['product_cart_icon']);
        Snackbars.success('${productLite.name ?? ''} agregado a tu carrito');
      },
    );
  }

  Future<void> removeFromCart() async {
    UserProductCartModel? cart =
        userProductController.getProductInCart(videoPostModel);

    if (cart == null) {
      return;
    }
    Either<String, Unit> response =
        await _userProductsRepository.removeFromCart(cart: cart);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Snackbars.success('${productLite.name ?? ''} removido de tu carrito');

        update(['product_cart_icon']);
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

  VariantVariantModel? getVariationWithName(String name) {
    return variantInfoModel!.variants!.firstWhereOrNull(
      (variant) => variant.name == name,
    );
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
        _stock = productVariantSelected!.stock;
        _suggestedPrice = productVariantSelected!.suggested_price;
        _price = productVariantSelected!.sale_price;
        _points = productVariantSelected!.points;
        _quantity = 1;
        update([
          'product_points',
          'product_price',
          'content_product',
          'product_quantity'
        ]);
      }
    }
  }

  ProductVariantModel? findMatchingCombination() {
    return listVariantCombinations.firstWhereOrNull(
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

  void openPhotoView() {
    MultiImageProvider multiImageProvider = MultiImageProvider([
      NetworkImage(product?.fullImage ?? product?.thumbnail ?? ''),
      if (_listImages.isNotEmpty)
        for (ProductImageModel image in _listImages)
          NetworkImage(image.fullImage ?? image.imageUrl),
    ]);

    showImageViewerPager(Get.context!, multiImageProvider,
        onPageChanged: (page) {}, onViewerDismissed: (page) {});
  }
}
