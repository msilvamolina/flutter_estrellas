import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/components/snackbars/snackbars.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/user_products/user_products_repository.dart';
import 'package:get/get.dart';

class UserProductController extends GetxController {
  UserProductsRepository userProductRepository = UserProductsRepository();

  Future<void> addToCart(ProductFirebaseLiteModel productLite) async {
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
}
