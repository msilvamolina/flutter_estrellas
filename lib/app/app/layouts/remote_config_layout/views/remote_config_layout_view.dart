import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/remote_config_layout_controller.dart';

class RemoteConfigLayout extends GetView<RemoteConfigLayoutController> {
  const RemoteConfigLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RemoteConfigLayoutView'),
        centerTitle: true,
      ),
      body: GetBuilder<RemoteConfigLayoutController>(
        init: RemoteConfigLayoutController(),
        builder: (controller) {
          return Center(
            child: Text(
              controller.isMaintenanceMode.value.toString(),
              style: TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
