import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/data/models/product_lite/product_lite.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../data/helpers/currency_helper.dart';
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

    double price = product?.price ?? 0;
    double suggestedPrice = product?.suggestedPrice ?? 0;

    double profit = suggestedPrice - price;

    int points = product?.points ?? 0;
    String profitStr =
        CurrencyHelpers.moneyFormat(amount: profit, withDecimals: false);
    String priceStr =
        CurrencyHelpers.moneyFormat(amount: price, withDecimals: false);

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;
    return GestureDetector(
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
                Container(
                  width:
                      48, // Ajusta el tamaño del contenedor para incluir el borde
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.white, width: 1), // Borde blanco
                  ),
                  child: ClipOval(
                    child: Image.network(
                      product?.thumbnail ?? '',
                      width: 44,
                      height: 44,
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
                        product?.name ?? '',
                        style: TypographyStyle.bodyBlackMedium.copyWith(
                          color: neutral50,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1), // Desplazamiento en x y y
                              blurRadius: 8, // Radio de desenfoque
                              color: Colors.black
                                  .withOpacity(0.5), // Color de la sombra
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            providerName,
                            style: TypographyStyle.bodyBlackMedium.copyWith(
                              color: neutral50,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              shadows: [
                                Shadow(
                                  offset:
                                      Offset(1, 1), // Desplazamiento en x y y
                                  blurRadius: 8, // Radio de desenfoque
                                  color: Colors.black
                                      .withOpacity(0.5), // Color de la sombra
                                ),
                              ],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: SvgPicture.asset(
                              'assets/svg/ellipse.svg',
                              width: 2,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: primaryLight,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '$points puntos',
                                      style: TypographyStyle.bodyRegularSmall
                                          .copyWith(
                                        color: primaryDark,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
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
                          color: neutral900,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              EstrellasIcons.handCoins,
                              color: neutral400,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Ganancia: $profitStr',
                              style: TypographyStyle.bodyRegularSmall.copyWith(
                                color: neutral400,
                                fontWeight: FontWeight.w500,
                              ),
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
                          color: neutral900,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              EstrellasIcons.currencyCircleDollar,
                              color: neutral400,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Precio: $priceStr',
                              style: TypographyStyle.bodyRegularSmall.copyWith(
                                color: neutral400,
                                fontWeight: FontWeight.w500,
                              ),
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
    );
  }
}
