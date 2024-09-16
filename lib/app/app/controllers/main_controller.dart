import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/dialogs/register/register_dialog.dart';
import 'package:flutter_estrellas/app/app/dialogs/register_basic_data/register_basic_data_dialog.dart';
import 'package:flutter_estrellas/app/components/dialogs/loader_dialog.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/auth/user_repository.dart';
import 'package:get/get.dart';

import '../../data/models/user_data/user_data.dart';
import '../dialogs/login/login_dialog.dart';

enum UserStatus {
  loading,
  notLogged,
  needBasicData,
  full,
}

class MainController extends GetxController {
  UserRepository userRepository = UserRepository();
  bool _withVolume = false;
  bool get withVolume => _withVolume;

  UserStatus? _userStatus = UserStatus.loading;
  UserStatus? get userStatus => _userStatus;

  UserData? _userData;
  UserData? get userData => _userData;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    checkUser();
    super.onReady();
  }

  Future<void> checkUser() async {
    _userStatus = UserStatus.loading;
    update(['login']);
    bool isAuthenticated = userRepository.isUserLogged();

    if (isAuthenticated) {
      _userData = await userRepository.getUserDataFirebase();
      if (userData != null) {
        _userStatus = UserStatus.full;
      } else {
        _userStatus = UserStatus.needBasicData;
      }
    } else {
      _userStatus = UserStatus.notLogged;
    }

    update(['login']);

    if (_userStatus == UserStatus.needBasicData) {
      openRegisterBasicDataDialog();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void openLoginDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return LoginDialog();
      },
    );
  }

  void signOut() {
    _userStatus = UserStatus.loading;
    update(['login']);
    userRepository.signOut();
    Future.delayed(Duration(milliseconds: 500), () {
      _userStatus = UserStatus.notLogged;
      update(['login']);
    });
  }

  void openRegisterDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return RegisterDialog();
      },
    );
  }

  void openRegisterBasicDataDialog() {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return RegisterBasicDataDialog();
      },
    );
  }

  void changeVolume() {
    _withVolume = !_withVolume;
    update();
  }

  void showLoader({String? title, String? message}) {
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (BuildContext context) {
        return LoaderDialog(title: title, message: message);
      },
    );
  }
}
