import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/components/snackbars/snackbars.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/user_products/user_products_repository.dart';
import 'package:get/get.dart';

class UserProductController extends GetxController {
  UserProductsRepository userProductRepository = UserProductsRepository();

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
}
