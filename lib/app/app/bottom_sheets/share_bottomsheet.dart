import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/modules/auth/email_verification/controllers/email_verification_controller.dart';
import 'package:flutter_estrellas/app/modules/main/account/controllers/account_controller.dart';
import 'package:flutter_estrellas/app/modules/main/home/controllers/home_controller.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'widgets/title_with_close_button.dart';

class ShareBottomsheet extends StatelessWidget {
  const ShareBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProductController>(
      id: 'share_bottomsheet',
      builder: (controller) {
        return Container(
          width: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.shareTitle,
                      style: TypographyStyle.h3Mobile,
                    ),
                    SizedBox(height: 22),
                  ],
                ),
              ),
              TitleWithCloseButton(title: ''),
            ],
          ),
        );
      },
    );
  }
}
