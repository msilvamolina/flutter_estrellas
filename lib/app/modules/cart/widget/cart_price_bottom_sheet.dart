import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../data/helpers/currency_helper.dart';

class CartPriceBottomBar extends StatelessWidget {
  const CartPriceBottomBar({
    required this.productsQuantity,
    required this.productsPrices,
    required this.productsPoints,
    required this.productsShipping,
    super.key,
  });

  final int productsQuantity;
  final double productsPrices;
  final int productsPoints;
  final double productsShipping;
  @override
  Widget build(BuildContext context) {
    String shippingStr =
        productsShipping == 0.0 ? '¡Gratis!' : productsShipping.toString();

    String priceStr =
        CurrencyHelpers.moneyFormat(amount: productsPrices, decimalIn0: false);

    double totalPrice = productsShipping + productsPrices;

    String totalPriceStr =
        CurrencyHelpers.moneyFormat(amount: totalPrice, decimalIn0: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Resumen de compra'),
        Row(
          children: [
            Text('Productos ($productsQuantity)'),
            Spacer(),
            Text(priceStr),
          ],
        ),
        Row(
          children: [
            Text('Envío'),
            Spacer(),
            Text(shippingStr),
          ],
        ),
        Row(
          children: [
            Text('Puntos'),
            Spacer(),
            Text('$productsPoints puntos'),
          ],
        ),
        Divider(),
        Row(
          children: [
            Text('Total a pagar'),
            Spacer(),
            Text(totalPriceStr),
          ],
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
