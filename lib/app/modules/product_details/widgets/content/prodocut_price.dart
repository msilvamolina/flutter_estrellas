import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/helpers/currency_helper.dart';
import 'package:flutter_estrellas/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';

import 'product_card_container.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: 'product_price',
      builder: (controller) {
        double price = controller.price;
        double suggestedPrice = controller.suggestedPrice;
        double profit = suggestedPrice - price;

        String priceStr = CurrencyHelpers.moneyFormat(
          amount: price,
          decimalIn0: false,
        );
        String profitStr = CurrencyHelpers.moneyFormat(
          amount: profit,
          decimalIn0: false,
        );
        return ProductCardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Precio',
                    style: TypographyStyle.bodyRegularLarge
                        .copyWith(color: neutral700),
                  ),
                  Spacer(),
                  Text(
                    priceStr,
                    style: TypographyStyle.bodyRegularLarge.copyWith(
                      color: neutral700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    'Ganas',
                    style: TypographyStyle.bodyRegularLarge
                        .copyWith(color: neutral700),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    decoration: BoxDecoration(
                        color: primaryLight,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      profitStr,
                      style: TypographyStyle.bodyRegularLarge.copyWith(
                        color: primaryDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
