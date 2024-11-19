import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import '../../data/helpers/currency_helper.dart';
import '../../data/models/user_product/user_product_model.dart';
import '../../data/models/videos/video_post_model.dart';
import '../../libraries/icons/icons_font.dart';
import '../../themes/styles/colors.dart';

class VideoProductCard extends StatelessWidget {
  const VideoProductCard({required this.videoProductModel, super.key});
  final VideoPostModel videoProductModel;

  @override
  Widget build(BuildContext context) {
    ProductFirebaseLiteModel? product = videoProductModel.product;

    double price = product?.price ?? 0;
    double suggestedPrice = product?.suggestedPrice ?? 0;

    double profit = suggestedPrice - price;

    int points = product?.points ?? 0;
    String profitStr =
        CurrencyHelpers.moneyFormat(amount: profit, withDecimals: false);
    String priceStr =
        CurrencyHelpers.moneyFormat(amount: price, withDecimals: false);
    double size = MediaQuery.of(context).size.width / 2;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    8), // Opcional, para bordes redondeados
                child: SizedBox(
                  width: size, // Tamaño del cuadrado
                  height: size,
                  child: CachedNetworkImage(
                      fit: BoxFit.cover, imageUrl: videoProductModel.thumbnail),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.only(left: 6, right: 8, top: 2, bottom: 3),
                decoration: BoxDecoration(
                  color: primaryLight,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(EstrellasIcons.medal),
                    Text(
                      '$points puntos',
                      style: TypographyStyle.bodyBlackMedium,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        8), // Opcional, para bordes redondeados
                    child: SizedBox(
                      width: 60, // Tamaño del cuadrado
                      height: 60,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: product?.thumbnail ?? '',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            videoProductModel.product?.name ?? '',
            style: TypographyStyle.bodyBlackLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                EstrellasIcons.currencyCircleDollar,
                color: neutral900,
                size: 18,
              ),
              SizedBox(width: 4),
              Row(
                children: [
                  Text(
                    'Precio: ',
                    style: TypographyStyle.bodyRegularMedium.copyWith(
                      color: neutral900,
                    ),
                  ),
                  Text(
                    priceStr,
                    style: TypographyStyle.bodyBlackLarge.copyWith(
                      color: neutral900,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                EstrellasIcons.handCoins,
                color: primaryDark,
                size: 18,
              ),
              SizedBox(width: 4),
              Row(
                children: [
                  Text(
                    'Ganancia: ',
                    style: TypographyStyle.bodyRegularMedium.copyWith(
                      color: primaryDark,
                    ),
                  ),
                  Text(
                    profitStr,
                    style: TypographyStyle.bodyBlackLarge.copyWith(
                      color: primaryDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
