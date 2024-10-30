import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/buttons/button_circle_svg.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../app/bottom_sheets/select_variant_size.dart';
import '../../../../components/bottom_sheets/bottomsheets.dart';
import '../../../../components/bottom_sheets/types.dart';
import '../../../../data/models/product_variant/product_variant_model.dart';
import '../../controllers/product_details_controller.dart';
import 'product_card_container.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
        id: 'product_quantity',
        builder: (controller) {
          return ProductCardContainer(
            child: Row(
              children: [
                Text(
                  'Cantidad',
                  style: TypographyStyle.bodyRegularLarge
                      .copyWith(color: neutral700),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(
                        color: neutral950, width: 1), // Borde verde de 2px
                    borderRadius: BorderRadius.all(
                        Radius.circular(12)), // Misma curvatura del ClipRRect
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    children: [
                      ButtonCircleSvg(
                          assetName: 'assets/svg/minus-icon.svg',
                          width: 24,
                          onTap: () {}),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          '1',
                          style: TypographyStyle.bodyRegularLarge
                              .copyWith(color: neutral700),
                        ),
                      ),
                      ButtonCircleSvg(
                          assetName: 'assets/svg/add-icon.svg',
                          width: 24,
                          onTap: () {}),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
