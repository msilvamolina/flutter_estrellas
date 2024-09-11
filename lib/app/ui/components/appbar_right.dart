import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controllers/main_controller.dart';
import '../amzwidgets/amz_icon_button.dart';

class AppbarRight extends StatelessWidget {
  const AppbarRight({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AmzIconButton(
              onPressed: _controller.openMoreOptions,
              icon: Icons.add,
              tooltip: 'Más opciones',
            ),
            8.widthBox,
            AmzIconButton(
              onPressed: _controller.openChat,
              icon: Icons.chat,
              tooltip: 'Chat',
            ),
            8.widthBox,
            AmzIconButton(
              onPressed: _controller.openNotifications,
              icon: Icons.notifications,
              badgeCount: 22,
              tooltip: 'Notifications',
            ),
            8.widthBox,
            AmzIconButton(
              onPressed: _controller.openUser,
              icon: Icons.person,
              badgeCount: 0,
              tooltip: 'Cuenta de usuario',
            ),
          ],
        );
      },
    );
  }
}
