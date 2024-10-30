import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/modules/product_details/widgets/variants/product_variants_color.dart';
import 'package:flutter_estrellas/app/modules/product_details/widgets/variants/product_variants_size.dart';

import '../../../../data/models/product_variant/product_variant_model.dart';

class ProductVariants extends StatelessWidget {
  const ProductVariants({required this.listVariants, super.key});

  final List<ProductVariantModel> listVariants;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductVariantsSize(
            listVariants:
                listVariants.where((item) => item.type == "size").toList()),
        SizedBox(height: 16),
        ProductVariantsColor(
            listVariants:
                listVariants.where((item) => item.type == "color").toList()),
      ],
    );
  }
}
