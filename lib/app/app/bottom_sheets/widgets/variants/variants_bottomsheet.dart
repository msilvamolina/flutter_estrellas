import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:get/get.dart';

import '../../../../modules/product_details/widgets/content/product_card_container.dart';
import '../../../../modules/product_details/widgets/product_variant_card.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../../../utils/utils.dart';

class VariantsBottomsheet extends StatelessWidget {
  const VariantsBottomsheet({required this.controller, super.key});

  final UserProductController controller;
  @override
  Widget build(BuildContext context) {
    if (controller.variantInfoModel != null) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int index = 0;
                index < controller.variantInfoModel!.attributes!.length;
                index++)
              Padding(
                padding: EdgeInsets.only(
                  bottom:
                      (controller.variantInfoModel!.attributes!.length - 1) <
                              index
                          ? 0
                          : 16,
                ),
                child: ProductCardContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => Row(
                          children: [
                            Text(
                              '${Utils.capitalize(controller.variantInfoModel!.attributes![index].name)}: ',
                              style: TypographyStyle.bodyRegularLarge
                                  .copyWith(color: neutral700),
                            ),
                            Text(
                              Utils.capitalize(controller.selectedVariantsMap[
                                      controller.variantInfoModel!
                                          .attributes![index].name] ??
                                  ''),
                              style: TypographyStyle.bodyRegularLarge.copyWith(
                                  color: neutral700,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        children: [
                          for (int index2 = 0;
                              index2 <
                                  controller
                                      .getVariations(controller
                                          .variantInfoModel!.attributes![index])
                                      .length;
                              index2++)
                            Obx(
                              () => GestureDetector(
                                onTap: () => controller.onCardPressed(
                                    controller.getVariations(controller
                                        .variantInfoModel!
                                        .attributes![index])[index2]),
                                child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    border: Border.all(
                                      color: controller.selectedVariantsMap[
                                                  controller
                                                      .getVariations(controller
                                                              .variantInfoModel!
                                                              .attributes![
                                                          index])[index2]
                                                      .attributeName] ==
                                              controller
                                                  .getVariations(controller
                                                          .variantInfoModel!
                                                          .attributes![
                                                      index])[index2]
                                                  .name
                                          ? primaryBase
                                          : neutral400,
                                      width: 2,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: ProductVariantCard(
                                    variant: controller.getVariations(controller
                                        .variantInfoModel!
                                        .attributes![index])[index2],
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
    }

    return SizedBox.shrink();
  }
}
