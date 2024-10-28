import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'product_card_container.dart';

class ProductVariationsColor extends StatelessWidget {
  const ProductVariationsColor({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Color',
                style: TypographyStyle.bodyRegularLarge
                    .copyWith(color: neutral700),
              ),
              SizedBox(width: 8),
              Text(
                'azul',
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
