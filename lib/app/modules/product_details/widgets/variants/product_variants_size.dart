import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import '../../../../data/models/product_variant/product_variant_model.dart';
import '../content/product_card_container.dart';

class ProductVariantsSize extends StatelessWidget {
  const ProductVariantsSize({required this.listVariants, super.key});
  final List<ProductVariantModel> listVariants;
  @override
  Widget build(BuildContext context) {
    return listVariants.isNotEmpty
        ? ProductCardContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Talla',
                      style: TypographyStyle.bodyRegularLarge
                          .copyWith(color: neutral700),
                    ),
                    Spacer(),
                    Text(
                      'M',
                      style: TypographyStyle.bodyRegularLarge.copyWith(
                        color: neutral700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(listVariants.toString()),
              ],
            ),
          )
        : SizedBox.shrink();
  }
}
