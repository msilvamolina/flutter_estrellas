import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/helpers/currency_helper.dart';
import '../../../../data/models/order/order_model.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../utils/utils.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({required this.order, super.key});

  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    String amountStr =
        CurrencyHelpers.moneyFormat(amount: order.amount, withDecimals: false);
    String profitStr =
        CurrencyHelpers.moneyFormat(amount: order.profit, withDecimals: false);

    String date = Utils.formatDate(order.createdAt);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                date,
                style: TypographyStyle.bodyRegularMedium,
              ),
              SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: CircleAvatar(
                  backgroundColor: neutral700,
                  radius: 1.5,
                ),
              ),
              SizedBox(width: 4),
              Text(
                'ID: ${order.orderId}',
                style: TypographyStyle.bodyRegularMedium,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: info50,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                width: 52,
                height: 52,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svg/Scroll.svg',
                    width: 26,
                    height: 26,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.status,
                    style: TypographyStyle.bodyBlackLarge
                        .copyWith(color: neutral700),
                  ),
                  Text(
                    '+${order.points} puntos',
                    style: TypographyStyle.bodyRegularMedium,
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amountStr,
                    style: TypographyStyle.bodyBlackLarge
                        .copyWith(color: neutral700),
                  ),
                  Text(
                    '+${profitStr}',
                    style: TypographyStyle.bodyRegularMedium,
                  ),
                ],
              ),
              SizedBox(width: 16),
              Icon(
                EstrellasIcons.arrowRight,
                color: neutral700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
