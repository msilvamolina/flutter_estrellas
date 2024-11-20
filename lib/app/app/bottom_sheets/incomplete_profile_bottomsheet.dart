import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/modules/auth/email_verification/controllers/email_verification_controller.dart';
import 'package:flutter_estrellas/app/modules/main/account/controllers/account_controller.dart';
import 'package:flutter_estrellas/app/modules/main/home/controllers/home_controller.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../components/buttons/buttons.dart';
import 'widgets/title_with_close_button.dart';

class IncompleteProfileBottomsheet extends StatelessWidget {
  const IncompleteProfileBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),
                Icon(
                  EstrellasIcons.smileySadFill,
                  color: error500,
                  size: 44,
                ),
                SizedBox(height: 16),
                Text(
                  'Perfil incompleto',
                  style: TypographyStyle.h3Mobile,
                ),
                SizedBox(height: 16),
                Text(
                  'Para poder hacer un retiro primero debes completar tu perfil',
                  style: TypographyStyle.bodyRegularMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 28),
                Button(
                  style: ButtonStyles.primary,
                  onPressed: () {
                    Get.toNamed(Routes.PROFILE);
                  },
                  label: 'Continuar',
                ),
              ],
            ),
          ),
          TitleWithCloseButton(
            title: '',
            actionClose: () {
              Get.back();
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
