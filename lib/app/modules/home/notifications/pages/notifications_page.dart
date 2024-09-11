import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../../ui/layouts/main_layout.dart';
import '../views/notifications_view.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_controller) {
        return MainLayout(
          view: NotificationsView(),
        );
      },
    );
  }
}
