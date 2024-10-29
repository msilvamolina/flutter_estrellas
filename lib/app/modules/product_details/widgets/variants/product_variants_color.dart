import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';

import '../../../../data/models/product_variant/product_variant_model.dart';
import '../../controllers/product_details_controller.dart';
import '../content/product_card_container.dart';

class ProductVariantsColor extends StatelessWidget {
  const ProductVariantsColor({required this.listVariants, super.key});
  final List<ProductVariantModel> listVariants;

  @override
  Widget build(BuildContext context) {
    double padding = 24;

    return listVariants.isNotEmpty
        ? GetBuilder<ProductDetailsController>(
            id: 'product_variant_color',
            builder: (controller) {
              controller.setFirstVariantColor(listVariants.first);
              return ProductCardContainer(
                padding: EdgeInsets.only(top: padding, left: padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Color: ',
                          style: TypographyStyle.bodyRegularLarge
                              .copyWith(color: neutral700),
                        ),
                        Text(
                          controller.userProductVariantColor?.name ?? '',
                          style: TypographyStyle.bodyRegularLarge.copyWith(
                            color: neutral700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      children: [
                        for (ProductVariantModel element in listVariants)
                          GestureDetector(
                            onTap: () => controller.chooseColorVariant(element),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: padding, bottom: padding),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: element.id ==
                                            controller
                                                .userProductVariantColor?.id
                                        ? primaryBase
                                        : neutral300,
                                    width: 3,
                                  ), // Borde verde de 2px
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ), // Misma curvatura del ClipRRect
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: CachedNetworkImage(
                                    imageUrl: element.imageUrl ?? '',
                                    width: 66,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            })
        : SizedBox.shrink();
  }
}
