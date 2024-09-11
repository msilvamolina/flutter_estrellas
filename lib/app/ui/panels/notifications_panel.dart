import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class NotificationsPanel extends GetView<MainController> {
  const NotificationsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.viewNotifications.value,
        child: Container(
          color: Colors.orange,
          width: 350,
          height: 300,
          child: Text('Notifications'),
        ),
      ),
    );
  }
}
