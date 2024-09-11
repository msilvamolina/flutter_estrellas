import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../../ui/layouts/main_layout.dart';
import '../views/messages_view.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_controller) {
        return MainLayout(
          view: MessagesView(),
        );
      },
    );
  }
}
