import 'package:flutter_estrellas/app/modules/main/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../../components/bottom_sheets/bottomsheets.dart';
import '../../../../components/bottom_sheets/types.dart';

class AccountController extends GetxController {
  HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> signOut() async {
    Bottomsheets.staticBottomSheet(BottomSheetTypes.signOut);
  }
}
