import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:get/get.dart';

import '../../../themes/styles/typography.dart';
import '../controllers/product_details_controller.dart';
import 'product_images.dart';

class ProductMainHeader extends StatelessWidget {
  const ProductMainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double padding = 16;
    double width = MediaQuery.of(context).size.width;

    double imageSize = width - (padding * 2);
    return SliverToBoxAdapter(
      child: GetBuilder<ProductDetailsController>(
        builder: (controller) {
          return Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                image: NetworkImage(controller.productLite.thumbnail ?? ''),
                fit: BoxFit.cover,
              ),
            ),
            margin: EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  padding:
                      EdgeInsets.only(left: 6, right: 8, top: 2, bottom: 3),
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
                ),
                Spacer(),
                Obx(
                  () => controller.listImages.isNotEmpty
                      ? ProductImagesCard(
                          listImages: controller.listImages,
                        )
                      : SizedBox.shrink(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
