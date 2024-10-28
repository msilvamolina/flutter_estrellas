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

class ProductDetailsController extends GetxController {
  MainController mainController = Get.find<MainController>();
  final ProductsRepository _repository = ProductsRepository();
  UserProductController userProductController =
      Get.find<UserProductController>();

  late ProductFirebaseLiteModel productLite;
  Rxn<ProductFirebaseModel> product = Rxn<ProductFirebaseModel>();

  final RxList<ProductImageModel> _listImages = <ProductImageModel>[].obs;
  List<ProductImageModel> get listImages => _listImages.toList();

  @override
  void onInit() {
    productLite = Get.arguments as ProductFirebaseLiteModel;
    product.bindStream(_repository.getProduct(productId: productLite.id));
    _listImages
        .bindStream(_repository.getProductImages(productId: productLite.id));

    super.onInit();
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
