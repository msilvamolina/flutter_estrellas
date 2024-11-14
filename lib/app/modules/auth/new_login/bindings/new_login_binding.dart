import 'package:get/get.dart';

import '../controllers/new_login_controller.dart';

class NewLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewLoginController>(
      () => NewLoginController(),
    );
  }
}
