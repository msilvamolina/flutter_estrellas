import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../controllers/main_controller.dart';
import '../../../../ui/dialogs/add_post_dialog.dart';

class HomeController extends GetxController with StateMixin<String> {
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  MainController mainController = Get.find();

  @override
  void onInit() {
    print('HomeController init');
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(Duration(seconds: 1), () {
      change('holis :)', status: RxStatus.success());
    });
    super.onReady();
  }

  void openDialog() {
    Get.dialog(AddPostDialog());
  }
}
