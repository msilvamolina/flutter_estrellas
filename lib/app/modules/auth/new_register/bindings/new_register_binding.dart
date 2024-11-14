import 'package:get/get.dart';

import '../controllers/new_register_controller.dart';

class NewRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewRegisterController>(
      () => NewRegisterController(),
    );
  }
}
