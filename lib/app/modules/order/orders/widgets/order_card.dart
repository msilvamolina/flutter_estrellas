import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import '../../../../data/helpers/currency_helper.dart';
import '../../../../data/models/order/order_model.dart';
import '../../../../themes/styles/colors.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({required this.order, super.key});

  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    String amountStr =
        CurrencyHelpers.moneyFormat(amount: order.amount, withDecimals: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            color: Colors.blue,
            width: 46,
            height: 46,
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Orden registrada',
                style: TypographyStyle.bodyRegularLarge,
              ),
              Text(
                '+10 puntos',
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
                style: TypographyStyle.bodyRegularMedium,
              ),
              Text('asda'),
            ],
          ),
          SizedBox(width: 16),
          Icon(
            EstrellasIcons.arrowRight,
            color: neutral700,
          ),
        ],
      ),
    );
  }
}
