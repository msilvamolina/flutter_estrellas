import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartPriceBottomBar extends StatelessWidget {
  const CartPriceBottomBar({
    required this.productsQuantity,
    required this.productsPrices,
    required this.productsPoints,
    required this.productsShipping,
    required this.productsTotal,
    super.key,
  });

  final int productsQuantity;
  final double productsPrices;
  final int productsPoints;
  final double productsShipping;
  final double productsTotal;
  @override
  Widget build(BuildContext context) {
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
            Text('$productsPrices'),
          ],
        ),
        Row(
          children: [
            Text('Envío'),
            Spacer(),
            Text('$productsShipping'),
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
            Text('$productsTotal'),
          ],
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
