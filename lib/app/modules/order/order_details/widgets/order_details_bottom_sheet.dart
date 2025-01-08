import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:text_transformation_animation/text_transformation_animation.dart';

import '../../../../data/helpers/currency_helper.dart';
import '../../../../data/models/order/order_model.dart';
import '../../../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../../../libraries/icons/icons_font.dart';
import '../../../../utils/utils.dart';

class OrderDetailsBottomSheet extends StatefulWidget {
  const OrderDetailsBottomSheet({
    required this.orderModel,
    super.key,
  });

  final OrderModel orderModel;

  @override
  _CartPriceBottomBarState createState() => _CartPriceBottomBarState();
}

class _CartPriceBottomBarState extends State<OrderDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TypographyStyle.bodyRegularLarge;

    TextStyle shippingStyle = TypographyStyle.bodyRegularLarge;

    TextStyle freeShippingStyle =
        TypographyStyle.bodyRegularLarge.copyWith(color: success900);

    TextStyle priceTextStyle = TypographyStyle.bodyRegularLarge.copyWith(
      fontWeight: FontWeight.w500,
    );
    TextStyle totalPriceStyle = TypographyStyle.bodyRegularLarge
        .copyWith(fontWeight: FontWeight.w700, fontSize: 20);

    double separationHeight = 12;

    String priceStr = CurrencyHelpers.moneyFormat(
        amount: widget.orderModel.amount, withDecimals: false);

    String profitStr = CurrencyHelpers.moneyFormat(
        amount: widget.orderModel.profit, withDecimals: false);

    String date = Utils.formatDate(widget.orderModel.createdAt);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Resumen de venta',
                    style: TypographyStyle.bodyBlackLarge.copyWith(
                      color: neutral950,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: warning50,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      'Pago pendiente',
                      style: TypographyStyle.bodyRegularMedium
                          .copyWith(color: warning900),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Fecha',
                    style: textStyle,
                  ),
                  Spacer(),
                  Text(
                    date,
                    style: priceTextStyle,
                  )
                ],
              ),
              SizedBox(height: separationHeight),
              Row(
                children: [
                  Text(
                    'Productos (',
                    style: textStyle,
                  ),
                  Text(
                    (widget.orderModel.products.length).toString(),
                    style: textStyle,
                  ),
                  Text(
                    ')',
                    style: textStyle,
                  ),
                  Spacer(),
                  Text(
                    priceStr,
                    style: priceTextStyle,
                  )
                ],
              ),
              SizedBox(height: separationHeight),
              Row(
                children: [
                  Text(
                    'Puntos',
                    style: textStyle,
                  ),
                  Spacer(),
                  Container(
                    padding:
                        EdgeInsets.only(left: 6, right: 12, top: 2, bottom: 3),
                    decoration: BoxDecoration(
                      color: primaryLight,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(EstrellasIcons.medal),
                        Text(
                          '${widget.orderModel.points} puntos',
                          style: TypographyStyle.bodyBlackMedium,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: separationHeight),
              Row(
                children: [
                  Text(
                    'Ganancia',
                    style: textStyle,
                  ),
                  Spacer(),
                  Text(
                    profitStr,
                    style: priceTextStyle,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
