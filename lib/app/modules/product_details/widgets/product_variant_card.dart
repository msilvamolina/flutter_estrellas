import 'package:flutter/material.dart';

import '../../../data/models/variant_variant/variant_variant.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../../../utils/utils.dart';

class ProductVariantCard extends StatelessWidget {
  const ProductVariantCard({required this.variant, super.key});

  final VariantVariantModel variant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (variant.imageUrl != null)
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(variant.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          )
        else ...[
          if (!variant.isColor && !variant.isImage)
            Container(
              constraints: BoxConstraints(
                minWidth: 52,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: white),
              height: 52,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      variant.value,
                      style: TypographyStyle.bodyBlackMedium.copyWith(
                        color: neutral700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (variant.isColor)
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Utils.getColor(variant.value),
                ),
                width: 52,
                height: 52,
                child: SizedBox.shrink()),
          if (variant.isImage)
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(variant.value),
                  fit: BoxFit.cover,
                ),
              ),
            )
        ],
      ],
    );
  }
}
