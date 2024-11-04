import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/dialogs/register/register_dialog.dart';
import 'package:flutter_estrellas/app/app/dialogs/register_basic_data/register_basic_data_dialog.dart';
import 'package:flutter_estrellas/app/components/dialogs/loader_dialog.dart';
import 'package:flutter_estrellas/app/data/providers/local/local_storage.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/auth/user_repository.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';

import '../../components/dialogs/loader_dropi_dialog.dart';
import '../../components/snackbars/snackbars.dart';
import '../../data/models/user_data/user_data.dart';
import '../../services/theme_service.dart';
import '../dialogs/login/login_dialog.dart';

enum UserStatus {
  loading,
  notLogged,
  needBasicData,
  full,
}

class MainController extends GetxController {
  LocalStorage localStorage = Get.find();
  UserRepository userRepository = UserRepository();

  bool _withVolume = true;
  bool get withVolume => _withVolume;

  UserStatus _userStatus = UserStatus.loading;
  UserStatus get userStatus => _userStatus;

  UserData? _userData;
  UserData? get userData => _userData;

  bool _isWelcome = false;
  bool _isThemeModeDark = false;

  bool get isThemeModeDark => _isThemeModeDark;
  RxString dropiMessage = ''.obs;
  RxBool dropiDialog = true.obs;

  RxString dropiDialogError = ''.obs;
  RxBool dropiDialogIsError = false.obs;

  String? _token;
  String? get token => _token;

  void setToken(String value) {
    _token = value;
  }

  void setDropiMessage(String message) {
    dropiMessage.value = message;
  }

  void setDropiDialog(bool value) {
    dropiDialog.value = value;
  }

  void setDropiDialogError(bool value, String message) {
    dropiDialogIsError.value = value;
    dropiDialogError.value = message;
  }

  @override
  Future<void> onInit() async {
    _isWelcome = await localStorage.getWelcome();
    // checkTheme();

    super.onInit();
  }

  void checkTheme() {
    _isThemeModeDark = ThemeService.isSavedDarkMode();
    update(['main', 'input']);
  }

  @override
  void onReady() async {
    checkUser();
    super.onReady();
  }

  Future<void> checkUser({bool login = false}) async {
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

    if (!kIsWeb) {
      if (_userStatus == UserStatus.notLogged) {
        if (!_isWelcome) {
          Get.offAllNamed(Routes.WELCOME);
        } else {
          Get.offAllNamed(Routes.LOGIN);
        }
      }
      if (_userStatus == UserStatus.needBasicData) {
        Get.offAllNamed(Routes.REGISTER_BASIC_DATA);
      }
      if (_userStatus == UserStatus.full) {
        Get.offAllNamed(Routes.HOME);
      }
    } else {
      if (_userStatus == UserStatus.needBasicData) {
        openRegisterBasicDataDialog();
      }
      if (_userStatus == UserStatus.full) {
        if (login) {
          String name = userData!.firstName;
          Snackbars.success('Hola $name!');
        }
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeThemeMode() {
    ThemeService.changeThemeMode();
    checkTheme();
    update(['themeButton']);
  }

  IconData getThemeIcon() {
    return isThemeModeDark ? Icons.light_mode : Icons.dark_mode;
  }

  void signOut() {
    _userStatus = UserStatus.loading;
    update(['login']);
    userRepository.signOut();
    Future.delayed(Duration(milliseconds: 500), () {
      _userStatus = UserStatus.notLogged;
      update(['login']);
      ThemeService.saveThemeMode(_isThemeModeDark);
      checkUser();
    });
  }

  void openLoginDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return LoginDialog();
      },
    );
  }

  void openRegisterDialog() {
    if (kIsWeb) {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return RegisterDialog();
        },
      );
    } else {
      Get.toNamed(Routes.REGISTER);
    }
  }

  void openRegisterBasicDataDialog() {
    if (kIsWeb) {
      showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (BuildContext context) {
          return RegisterBasicDataDialog();
        },
      );
    } else {
      Get.offAndToNamed(Routes.REGISTER_BASIC_DATA);
    }
  }

  void openAlertHelpText() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              '¿Necesitas ayuda?',
              style: TypographyStyle.h3Mobile,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('¿Necesitas ayuda?'),
                  Text('¿Necesitas ayuda?'),
                  Text('¿Necesitas ayuda?'),
                  Text('¿Necesitas ayuda?'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text("Aceptar"),
                onPressed: () {},
              )
            ],
          );
        });
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

  void showDropiLoader() {
    setDropiDialogError(false, '');
    setDropiMessage('Espero un momento por favor');
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (BuildContext context) {
        return const LoaderDropiDialog();
      },
    );
  }
}
