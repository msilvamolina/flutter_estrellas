import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/layout/remote_config/remote_config_controller.dart';
import 'package:flutter_estrellas/app/components/buttons/buttons.dart';
import 'package:get/get.dart';

class NewVersionScreen extends StatelessWidget {
  const NewVersionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RemoteConfigController>(
        builder: (controller) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Button(
                onPressed: controller.skipVersion,
                style: ButtonStyles.secondary,
                label: 'Lo haré mas tarde',
              ),
            ),
          );
        },
      ),
    );
  }
}
