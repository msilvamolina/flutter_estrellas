import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class UserPanel extends GetView<MainController> {
  const UserPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.viewUser.value,
        child: Container(
          color: Colors.pink,
          width: 350,
          height: 300,
          child: Text('User'),
        ),
      ),
    );
  }
}
