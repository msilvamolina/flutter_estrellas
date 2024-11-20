import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../../../components/bottom_sheets/bottomsheets.dart';
import '../../../../components/bottom_sheets/types.dart';

class WalletController extends GetxController {
  MainController mainController = Get.find<MainController>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // if (mainController.userData == null) {
    //   Bottomsheets.staticBottomSheet(BottomSheetTypes.incompleteProfile,
    //       isDismissible: false);
    // }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
