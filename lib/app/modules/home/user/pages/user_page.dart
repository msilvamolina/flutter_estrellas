import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../../ui/layouts/main_layout.dart';
import '../views/user_view.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_controller) {
        return MainLayout(
          view: UserView(),
        );
      },
    );
  }
}
