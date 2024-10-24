import 'package:get/get.dart';

import '../controllers/select_payment_controller.dart';

class SelectPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectPaymentController>(
      () => SelectPaymentController(),
    );
  }
}
