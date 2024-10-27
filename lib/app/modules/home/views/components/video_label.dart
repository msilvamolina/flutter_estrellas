import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/data/models/product_lite/product_lite.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../data/models/videos/video_post_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/typography.dart';

class VideoLabel extends StatelessWidget {
  const VideoLabel({required this.videoPostModel, super.key});
  final VideoPostModel videoPostModel;

  @override
  Widget build(BuildContext context) {
    ProductFirebaseLiteModel? product = videoPostModel.product;
    String providerName = 'Estrellas';
    if (product?.provider != null) {
      if (product?.provider['name'] != null) {
        providerName = product?.provider['name'];
      }
    }

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;
    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.bottomCenter,
      //     end: Alignment.topCenter,
      //     colors: [
      //       Colors.black,
      //       Colors.transparent,
      //     ],
      //   ),
      // ),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.PRODUCT, arguments: product),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Hero(
                      tag: 'productHeroTag-${product!.id}',
                      child: Image.network(
                        product.thumbnail ?? '',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          product.name ?? '',
                          style: TypographyStyle.bodyRegularMedium
                              .copyWith(color: white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              providerName,
                              style: TypographyStyle.bodyBlackSmall
                                  .copyWith(color: white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: neutral500,
                              width: 1,
                            ),
                            color: neutral600.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/medal.svg',
                                width: 10,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Puntos: ${product.points}',
                                style: TypographyStyle.bodyRegularSmall
                                    .copyWith(color: white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: neutral500,
                              width: 1,
                            ),
                            color: neutral600.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/coins.svg',
                                width: 10,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Precio: ${product.suggestedPrice}',
                                style: TypographyStyle.bodyRegularSmall
                                    .copyWith(color: white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
