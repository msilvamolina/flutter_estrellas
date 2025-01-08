import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/user_product_controller.dart';
import '../../../../components/bottom_sheets/bottomsheets.dart';
import '../../../../components/bottom_sheets/types.dart';
import '../../../../routes/app_pages.dart';

class WalletController extends GetxController {
  MainController mainController = Get.find<MainController>();
  UserProductController userProductController =
      Get.find<UserProductController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    if (mainController.userData == null) {
      Bottomsheets.staticBottomSheet(BottomSheetTypes.incompleteProfile,
          isDismissible: false);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> goToOrders() async {
    final result = await Get.toNamed(Routes.ORDERS);
    if (result != null) {
      Get.offNamed(Routes.HOME);
    }
  }
}
