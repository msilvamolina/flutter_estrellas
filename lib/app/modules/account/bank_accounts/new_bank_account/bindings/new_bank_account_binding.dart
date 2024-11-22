import 'package:get/get.dart';

import '../controllers/new_bank_account_controller.dart';

class NewBankAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewBankAccountController>(
      () => NewBankAccountController(),
    );
  }
}
