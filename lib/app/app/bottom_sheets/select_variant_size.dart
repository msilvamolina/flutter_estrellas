import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../components/buttons/buttons.dart';
import '../../components/inputs/text_input.dart';

import '../../data/models/product_variant/product_variant_model.dart';
import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';
import 'widgets/content_bottomsheet.dart';
import 'widgets/title_with_close_button.dart';

class SelectVariantSizeBottomSheet extends StatelessWidget {
  const SelectVariantSizeBottomSheet({required this.listVariants, super.key});
  final List<ProductVariantModel> listVariants;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: 'product_variant_size',
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TitleWithCloseButton(
                title: 'Seleccionar la talla',
                style: TypographyStyle.h2Mobile.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              ContentBottomsheet(
                children: [
                  Wrap(
                    children: [
                      for (ProductVariantModel element in listVariants)
                        GestureDetector(
                          onTap: () => controller.chooseSizeVariant(element),
                          child: Container(
                            margin: EdgeInsets.only(right: 16, bottom: 16),
                            decoration: BoxDecoration(
                              color: controller.userProductVariantSize?.id ==
                                      element.id
                                  ? primaryBase
                                  : white,
                              border: Border.all(
                                  color:
                                      controller.userProductVariantSize?.id ==
                                              element.id
                                          ? neutral950
                                          : neutral300,
                                  width: 2), // Borde verde de 2px
                              borderRadius: BorderRadius.all(Radius.circular(
                                  12)), // Misma curvatura del ClipRRect
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: Text(
                              element.label,
                              style: TypographyStyle.bodyRegularMedium.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
