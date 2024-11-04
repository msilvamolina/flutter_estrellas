import 'package:get/get.dart';

import '../controllers/remote_config_layout_controller.dart';

class RemoteConfigLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RemoteConfigLayoutController>(
      RemoteConfigLayoutController(),
    );
  }
}
