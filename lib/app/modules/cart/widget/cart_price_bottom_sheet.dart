import 'package:flutter/material.dart';
import 'package:text_transformation_animation/text_transformation_animation.dart';

import '../../../data/helpers/currency_helper.dart';

class CartPriceBottomBar extends StatefulWidget {
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
  _CartPriceBottomBarState createState() => _CartPriceBottomBarState();
}

class _CartPriceBottomBarState extends State<CartPriceBottomBar> {
  int? previousQuantity;
  double? previousPrices;
  int? previousPoints;
  double? previousShipping;

  @override
  void initState() {
    super.initState();
    // Inicializamos los valores previos con los valores actuales para evitar la animación al entrar por primera vez
    previousQuantity = widget.productsQuantity;
    previousPrices = widget.productsPrices;
    previousPoints = widget.productsPoints;
    previousShipping = widget.productsShipping;
  }

  @override
  void didUpdateWidget(covariant CartPriceBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Detecta cambios en los valores y actualiza los valores anteriores
    if (widget.productsQuantity != oldWidget.productsQuantity) {
      previousQuantity = oldWidget.productsQuantity;
    }
    if (widget.productsPrices != oldWidget.productsPrices) {
      previousPrices = oldWidget.productsPrices;
    }
    if (widget.productsPoints != oldWidget.productsPoints) {
      previousPoints = oldWidget.productsPoints;
    }
    if (widget.productsShipping != oldWidget.productsShipping) {
      previousShipping = oldWidget.productsShipping;
    }
  }

  @override
  Widget build(BuildContext context) {
    String shippingStr = widget.productsShipping == 0.0
        ? '¡Gratis!'
        : widget.productsShipping.toString();
    String priceStr = CurrencyHelpers.moneyFormat(
        amount: widget.productsPrices, decimalIn0: false);
    double totalPrice = widget.productsShipping + widget.productsPrices;
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
            // Solo anima si hay un cambio en productsQuantity
            if (widget.productsQuantity == previousQuantity)
              Text(widget.productsQuantity.toString())
            else
              TextTransformationAnimation(
                text: widget.productsQuantity.toString(),
                duration: textAnimationDuration,
                alphabet: numberAlphabet,
              ),
            Text(')'),
            Spacer(),
            // Solo anima si hay un cambio en productsPrices
            if (widget.productsPrices == previousPrices)
              Text(priceStr)
            else
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
            // Solo anima si hay un cambio en productsPoints
            if (widget.productsPoints == previousPoints)
              Text('${widget.productsPoints} puntos')
            else
              Row(
                children: [
                  TextTransformationAnimation(
                    text: widget.productsPoints.toString(),
                    duration: textAnimationDuration,
                    alphabet: numberAlphabet,
                  ),
                  Text(' puntos'),
                ],
              ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Text('Total a pagar'),
            Spacer(),
            // Solo anima si hay un cambio en el precio total
            if (totalPrice == (previousShipping ?? 0) + (previousPrices ?? 0))
              Text(
                totalPriceStr,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            else
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
