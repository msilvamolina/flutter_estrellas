import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/modules/main/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../../components/bottom_sheets/bottomsheets.dart';
import '../../../../components/bottom_sheets/types.dart';

class AccountController extends GetxController {
  MainController mainController = Get.find<MainController>();
  HomeController homeController = Get.find<HomeController>();

  RxnString userTitle = RxnString();

  @override
  void onReady() {
    userTitle.value = mainController.userData != null
        ? mainController.userData?.fullName
        : mainController.userEmail;

    super.onReady();
  }

  Future<void> signOut() async {
    Bottomsheets.staticBottomSheet(BottomSheetTypes.signOut);
  }
}
