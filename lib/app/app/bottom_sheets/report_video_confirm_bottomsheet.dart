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

class ReportVideoConfirmBottomsheet extends StatelessWidget {
  const ReportVideoConfirmBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProductController>(
      id: 'report_video_confirm_bottomsheet',
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
                      '¿Seguro quieres reportar\neste video?',
                      style: TypographyStyle.h3Mobile,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Vas a reportar este video por: ',
                        style: TypographyStyle.bodyRegularLarge
                            .copyWith(color: neutral800),
                        children: <TextSpan>[
                          TextSpan(
                            text: controller.getReportVideosText(),
                            style: TypographyStyle.bodyBlackLarge
                                .copyWith(color: neutral950),
                          ),
                          TextSpan(
                            text: '.',
                            style: TypographyStyle.bodyBlackLarge
                                .copyWith(color: neutral950),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 22),
                    Obx(
                      () => LoadingButton(
                        isLoading:
                            controller.reportVideoConfirmButtonIsLoading.value,
                        style: ButtonStyles.primary,
                        onPressed: controller.reportVideoConfirmButtonPressed,
                        label: 'Reportar',
                      ),
                    ),
                    SizedBox(height: 24),
                    Button(
                      style: ButtonStyles.secondary,
                      onPressed: Get.back,
                      label: 'Cancelar',
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
