import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class MoreOptionsPanel extends GetView<MainController> {
  const MoreOptionsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.viewMoreOptions.value,
        child: Container(
          color: Colors.yellow,
          width: 350,
          height: 300,
          child: Text('More options'),
        ),
      ),
    );
  }
}
