import 'package:get/get.dart';

import '../controllers/login_start_controller.dart';

class LoginStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginStartController>(
      () => LoginStartController(),
    );
  }
}
