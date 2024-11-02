import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/modules/main/account/controllers/account_controller.dart';
import 'package:flutter_estrellas/app/modules/main/home/controllers/home_controller.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../components/buttons/buttons.dart';

class SignOutBottomsheet extends StatelessWidget {
  const SignOutBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      id: 'signout_bottom_sheet',
      builder: (controller) {
        return Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  EstrellasIcons.infoFill,
                  color: info500,
                  size: 44,
                ),
                SizedBox(height: 16),
                Text(
                  '¿Estás seguro de cerrar sesión?',
                  style: TypographyStyle.h3Mobile,
                ),
                SizedBox(height: 22),
                Button(
                  style: ButtonStyles.primary,
                  onPressed: () {},
                  label: 'Sí',
                ),
                SizedBox(height: 24),
                Button(
                  style: ButtonStyles.secondary,
                  onPressed: () {},
                  label: 'No',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
