import 'package:get/get.dart';

import '../controllers/register_basic_data_controller.dart';

class RegisterBasicDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterBasicDataController>(
      () => RegisterBasicDataController(),
    );
  }
}
