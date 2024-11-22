import 'package:get/get.dart';

import '../controllers/notifications_list_controller.dart';

class NotificationsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsListController>(
      () => NotificationsListController(),
    );
  }
}
