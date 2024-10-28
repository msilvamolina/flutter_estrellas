import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:get/get.dart';

import '../../../themes/styles/typography.dart';
import '../controllers/product_details_controller.dart';

class ProductMainHeader extends StatelessWidget {
  const ProductMainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: GetX<ProductDetailsController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: CachedNetworkImage(
                            imageUrl: controller.productLite.thumbnail ?? ''),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.only(
                            left: 6, right: 8, top: 2, bottom: 3),
                        decoration: BoxDecoration(
                          color: primaryLight,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(EstrellasIcons.medal),
                            Text(
                              '${controller.productLite.points} puntos',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text('product: '),
                  Text(controller.product.toString()),
                  SizedBox(height: 26),
                  Text('imagenes: '),
                  Text(controller.listImages.toString()),
                ],
              ),
            );
          },
        ),
      );
}
