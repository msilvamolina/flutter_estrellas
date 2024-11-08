import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:text_transformation_animation/text_transformation_animation.dart';

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

    Duration textAnimationDuration = Duration(milliseconds: 1000);

    String moneyAlphabet = '0123456789.,\$';
    String numberAlphabet = '0123456789';
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Resumen de compra'),
        Row(
          children: [
            Text('Productos ('),
            TextTransformationAnimation(
              text: productsQuantity.toString(),
              duration: textAnimationDuration,
              alphabet: numberAlphabet,
            ),
            Text(')'),
            Spacer(),
            TextTransformationAnimation(
              text: priceStr,
              duration: textAnimationDuration,
              alphabet: moneyAlphabet,
            ),
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
            TextTransformationAnimation(
              text: productsPoints.toString(),
              duration: textAnimationDuration,
              alphabet: numberAlphabet,
            ),
            Text(' puntos'),
          ],
        ),
        Divider(),
        Row(
          children: [
            Text('Total a pagar'),
            Spacer(),
            TextTransformationAnimation(
              text: totalPriceStr,
              duration: textAnimationDuration,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              alphabet: moneyAlphabet,
            ),
          ],
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
