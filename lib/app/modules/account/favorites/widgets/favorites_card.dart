import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import '../../../../data/helpers/currency_helper.dart';
import '../../../../data/models/user_product/user_product_model.dart';
import '../../../../libraries/icons/icons_font.dart';
import '../../../../themes/styles/colors.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({required this.userProductModel, super.key});
  final UserProductModel userProductModel;

  @override
  Widget build(BuildContext context) {
    ProductFirebaseLiteModel? product = userProductModel.video?.product;

    double price = product?.price ?? 0;
    double suggestedPrice = product?.suggestedPrice ?? 0;

    double profit = suggestedPrice - price;

    int points = product?.points ?? 0;
    String profitStr =
        CurrencyHelpers.moneyFormat(amount: profit, withDecimals: false);
    String priceStr =
        CurrencyHelpers.moneyFormat(amount: price, withDecimals: false);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                    imageUrl: userProductModel.video?.thumbnail ?? ''),
                Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                      color: secondaryBase,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Text(
                    '$points puntos',
                    style: TypographyStyle.bodyRegularSmall.copyWith(
                      color: white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: CachedNetworkImage(
                      imageUrl: product?.thumbnail ?? '',
                      width: 60,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              userProductModel.video?.product?.name ?? '',
              style: TypographyStyle.bodyBlackMedium,
            ),
            SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  EstrellasIcons.currencyCircleDollar,
                  color: primaryDark,
                  size: 18,
                ),
                SizedBox(width: 4),
                Text(
                  'Precio: $priceStr',
                  style: TypographyStyle.bodyRegularSmall.copyWith(
                    color: primaryDark,
                    fontWeight: FontWeight.w500,
                  ),
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
                Text(
                  'Ganancia: $profitStr',
                  style: TypographyStyle.bodyRegularSmall.copyWith(
                    color: primaryDark,
                    fontWeight: FontWeight.w500,
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
