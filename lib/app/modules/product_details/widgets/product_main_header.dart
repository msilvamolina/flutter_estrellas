import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../components/images/cached_image_with_thumb.dart';
import '../../../libraries/icons/icons_font.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../controllers/product_details_controller.dart';
import 'product_content.dart';
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
          return Column(
            children: [
              GestureDetector(
                onTap: controller.openPhotoView,
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  margin: EdgeInsets.all(padding),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: CachedImageWithThumb(
                          thumbnail: controller.product?.thumbnail,
                          fullImage: controller.product?.fullImage,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GetBuilder<ProductDetailsController>(
                            id: 'product_points',
                            builder: (_) {
                              return Container(
                                margin: EdgeInsets.all(16),
                                padding: EdgeInsets.only(
                                    left: 6, right: 8, top: 2, bottom: 3),
                                decoration: BoxDecoration(
                                  color: primaryLight,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      EstrellasIcons.medal,
                                      color: neutral900,
                                    ),
                                    Text(
                                      '${controller.points} puntos',
                                      style: TypographyStyle.bodyBlackMedium
                                          .copyWith(color: neutral900),
                                    ),
                                  ],
                                ),
                              );
                            },
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
                    ],
                  ),
                ),
              ),
              ProductContent(),
            ],
          );
        },
      ),
    );
  }
}
