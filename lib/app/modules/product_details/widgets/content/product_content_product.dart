import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../components/buttons/button_circle_svg.dart';
import '../../controllers/product_details_controller.dart';

class ProductContentProduct extends StatelessWidget {
  const ProductContentProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: 'content_product',
      builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: neutral200,
            borderRadius: BorderRadius.circular(14),
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.productLite.name ?? '',
                style: TypographyStyle.bodyBlackLarge.copyWith(
                  color: neutral900,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Tangerine Company',
                    style: TypographyStyle.bodyRegularMedium.copyWith(
                      color: neutral700,
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 6),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: CircleAvatar(
                      backgroundColor: neutral500,
                      radius: 1.5,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    EstrellasIcons.starFill,
                    color: tertiaryBase,
                    size: 22,
                  ),
                  Text(
                    '4.8',
                    style: TypographyStyle.bodyRegularMedium.copyWith(
                      color: neutral700,
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'comentarios',
                    style: TypographyStyle.bodyRegularMedium.copyWith(
                      color: neutral700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '¡Quedan 12!',
                    style: TypographyStyle.bodyBlackMedium.copyWith(
                      color: secondaryBase,
                    ),
                  ),
                  Spacer(),
                  ButtonCircleSvg(
                    assetName: 'assets/svg/Heart.svg',
                    color: neutral700,
                    onTap: () {},
                    width: 28,
                  ),
                  ButtonCircleSvg(
                    assetName: 'assets/svg/Comment.svg',
                    color: neutral700,
                    onTap: () {},
                    width: 22,
                  ),
                  ButtonCircleSvg(
                    assetName: 'assets/svg/Cart.svg',
                    color: neutral700,
                    onTap: () {},
                    width: 26,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
