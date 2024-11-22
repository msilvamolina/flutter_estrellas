import 'package:get/get.dart';

import '../controllers/bank_accounts_controller.dart';

class BankAccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BankAccountsController>(
      () => BankAccountsController(),
    );
  }
}
