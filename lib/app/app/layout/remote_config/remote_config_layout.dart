import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/layout/remote_config/screens/force_update_screen.dart';
import 'package:get/get.dart';
import '../../../config/features/features.dart';
import 'remote_config_controller.dart';
import 'screens/maintenance_screen.dart';
import 'screens/new_version_screen.dart';

class RemoteConfigLayout extends StatelessWidget {
  const RemoteConfigLayout({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final RemoteConfigController controller =
        Get.find<RemoteConfigController>();

    return Obx(() {
      if (controller.checkFeature(Features.maintenance)) {
        return MaintenanceScreen();
      } else if (controller.checkForceUpdate()) {
        return ForceUpdateScreen();
      }

      return Stack(
        children: [
          child,
          if (controller.checkNewVersion())
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: NewVersionScreen(),
              ),
            ),
        ],
      );
    });
  }
}
