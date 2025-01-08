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
          return CircularProgressIndicator();
        }
        return VariantsBottomsheet(controller: controller);
      },
    );
  }
}
