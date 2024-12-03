import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';

import '../../../../components/snackbars/snackbars.dart';

class LoginStartController extends GetxController {
  AuthRepository _authRepository = AuthRepository();

  MainController mainController = Get.find<MainController>();
  UserProductController userProductController =
      Get.find<UserProductController>();

  Future<void> loginApple() async {
    Either<String, Unit> authFailureOrSuccessOption =
        await _authRepository.signInWithApple();

    authFailureOrSuccessOption.fold(
      (failure) {
        Get.back();
        Snackbars.error(failure);
      },
      (_) async {
        // Get.back();
        Get.back();

        mainController.checkUser(login: true);
        await mainController.reloadUserData();
        userProductController.fillUserList();
      },
    );
  }

  Future<void> loginGoogle() async {
    Either<String, Unit> authFailureOrSuccessOption =
        await _authRepository.signInWithGoogle();

    authFailureOrSuccessOption.fold(
      (failure) {
        Get.back();
        Snackbars.error(failure);
      },
      (_) async {
        // Get.back();
        Get.back();

        mainController.checkUser(login: true);
        await mainController.reloadUserData();
        userProductController.fillUserList();
      },
    );
  }

  Future<void> loginFacebook() async {
    Either<String, Unit> authFailureOrSuccessOption =
        await _authRepository.signInWithFacebook();

    authFailureOrSuccessOption.fold(
      (failure) {
        Get.back();
        Snackbars.error(failure);
      },
      (_) async {
        // Get.back();
        Get.back();

        mainController.checkUser(login: true);
        await mainController.reloadUserData();
        userProductController.fillUserList();
      },
    );
  }
}
