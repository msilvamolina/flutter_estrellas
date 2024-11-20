import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_estrellas/app/data/models/product_variant_combination/product_variant_combination_model.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_svg/svg.dart';

class VariationWidget extends StatelessWidget {
  const VariationWidget({required this.variantCombination, super.key});

  final ProductVariantCombinationModel variantCombination;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/svg/Palette.svg',
          width: 18,
        ),
        SizedBox(width: 4),
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: variantCombination.imageUrl ?? '',
            width: 16,
          ),
        ),
        SizedBox(width: 8),
        SvgPicture.asset(
          'assets/svg/ellipse.svg',
          colorFilter: ColorFilter.mode(
            neutral700,
            BlendMode.srcIn,
          ),
          width: 4,
        ),
        SizedBox(width: 8),
        SvgPicture.asset(
          'assets/svg/Ruler.svg',
          width: 18,
        ),
        SizedBox(width: 4),
        Text(variantCombination.sizeLabel ?? '')
      ],
    );
  }
}
