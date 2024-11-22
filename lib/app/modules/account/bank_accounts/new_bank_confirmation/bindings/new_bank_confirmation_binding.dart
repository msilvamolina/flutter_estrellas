import 'package:get/get.dart';

import '../controllers/new_bank_confirmation_controller.dart';

class NewBankConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewBankConfirmationController>(
      () => NewBankConfirmationController(),
    );
  }
}
