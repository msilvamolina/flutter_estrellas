import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:get/get.dart';

import '../../../../services/theme_service.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (mainController) {
        return SafeArea(
          child: Column(
            children: [
              Text('Hola'),
              if (mainController.userStatus == UserStatus.full)
                ElevatedButton(
                  onPressed: mainController.signOut,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .secondaryContainer, // Color secundario
                    foregroundColor: mainController.isThemeModeDark
                        ? Colors.white
                        : neutral900,
                  ),
                  child: Text('Cerrar sesión'),
                ),
            ],
          ),
        );
      },
    );
  }
}
