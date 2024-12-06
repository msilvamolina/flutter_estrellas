import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/modules/main/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../../components/bottom_sheets/bottomsheets.dart';
import '../../../../components/bottom_sheets/types.dart';
import '../../../../routes/app_pages.dart';

class AccountController extends GetxController {
  MainController mainController = Get.find<MainController>();
  HomeController homeController = Get.find<HomeController>();

  RxnString userTitle = RxnString();
  RxnString userImage = RxnString();

  @override
  void onReady() {
    checkUser();
    super.onReady();
  }

  void checkUser() {
    userTitle.value = mainController.userData != null
        ? mainController.userData?.fullName
        : mainController.userEmail;

    if (mainController.userData != null) {
      userImage.value = mainController.userData?.imageUrl;
    }
  }

  Future<void> goToProfile() async {
    await Get.toNamed(Routes.PROFILE);
    checkUser();
  }

  Future<void> signOut() async {
    Bottomsheets.staticBottomSheet(BottomSheetTypes.signOut);
  }

  Future<void> goToOrders() async {
    final result = await Get.toNamed(Routes.ORDERS);
    if (result != null) {
      Get.offNamed(Routes.HOME);
    }
  }
}
