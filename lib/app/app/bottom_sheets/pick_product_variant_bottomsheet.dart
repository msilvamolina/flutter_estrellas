import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../components/buttons/buttons.dart';
import '../../components/inputs/text_input.dart';

import '../../themes/styles/typography.dart';
import 'widgets/content_bottomsheet.dart';
import 'widgets/title_with_close_button.dart';
import 'widgets/variants/variants_bottomsheet.dart';

class PickProductVariantBottomsheet extends StatelessWidget {
  const PickProductVariantBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProductController>(
      id: 'pick_product_variant_bottom_sheet',
      builder: (controller) {
        if (controller.isVariantsLoading) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(40),
                child: SizedBox(
                  width: 24,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          );
        }
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TitleWithCloseButton(title: ''),
              VariantsBottomsheet(controller: controller),
              Padding(
                padding: const EdgeInsets.all(16),
                child: LoadingButton(
                  isLoading: controller.isPickVariantButtonLoading,
                  style: ButtonStyles.primary,
                  onPressed: controller.isVariantsButtonEnabled
                      ? controller.onPickVariantButtonPressed
                      : null,
                  label: controller.isVariantsButtonText,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
