import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../app/dialogs/register/register_screen.dart';
import '../../../../app/dialogs/register_basic_data/register_basic_data_screen.dart';
import '../../../../components/layouts/auth_layout.dart';
import '../controllers/register_basic_data_controller.dart';

class RegisterBasicDataView extends GetView<RegisterBasicDataController> {
  const RegisterBasicDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GetBuilder<MainController>(
              id: 'themeButton',
              builder: (mainController) {
                return IconButton(
                  onPressed: mainController.changeThemeMode,
                  icon: Icon(mainController.getThemeIcon()),
                );
              },
            ),
            Hero(
              tag: 'helpButton',
              child: IconButton(
                onPressed: controller.mainController.openAlertHelpText,
                icon: Icon(Icons.help_outline),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: RegisterBasicDataScreen(),
        ),
      ),
    );
  }
}
