import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: 'contentView',
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
                children: [
                  Text(
                    'Tangerine Company',
                    style: TypographyStyle.bodyRegularMedium.copyWith(
                      color: neutral700,
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(EstrellasIcons.usersFill)
                  // SvgPicture.asset(
                  //   'assets/svg/ellipse.svg',
                  //   width: 10,
                  // ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
