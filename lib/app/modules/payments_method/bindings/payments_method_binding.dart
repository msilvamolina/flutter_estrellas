import 'package:get/get.dart';

import '../controllers/payments_method_controller.dart';

class PaymentsMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentsMethodController>(
      () => PaymentsMethodController(),
    );
  }
}
