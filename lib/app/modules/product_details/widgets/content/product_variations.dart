import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'product_card_container.dart';

class ProductVariationsSize extends StatelessWidget {
  const ProductVariationsSize({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductCardContainer(
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
        ],
      ),
    );
  }
}
