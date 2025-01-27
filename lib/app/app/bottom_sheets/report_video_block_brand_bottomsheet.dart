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
import 'widgets/title_with_close_button.dart';

class ReportVideoBlockBrandBottomsheet extends StatelessWidget {
  const ReportVideoBlockBrandBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProductController>(
      id: 'report_video_block_brand_bottomsheet',
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
                    SizedBox(height: 16),
                    Icon(
                      EstrellasIcons.infoFill,
                      color: info500,
                      size: 44,
                    ),
                    SizedBox(height: 16),
                    Text(
                      '¿Deseas bloquear esta marca?',
                      style: TypographyStyle.h3Mobile,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Sus videos no se mostrarán\nnuevamente en tu feed',
                      style: TypographyStyle.bodyRegularLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    SizedBox(height: 22),
                    Button(
                      style: ButtonStyles.primary,
                      onPressed: () =>
                          controller.reportVideoBlockBrandButtonPressed(true),
                      label: 'Sí, bloquear',
                    ),
                    SizedBox(height: 24),
                    Button(
                      style: ButtonStyles.secondary,
                      onPressed: () =>
                          controller.reportVideoBlockBrandButtonPressed(false),
                      label: 'No bloquear',
                    ),
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
