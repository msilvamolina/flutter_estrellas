import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class ChatPanel extends GetView<MainController> {
  const ChatPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.viewChat.value,
        child: Container(
          color: Colors.green,
          width: 350,
          height: 300,
          child: Text('Chat'),
        ),
      ),
    );
  }
}
