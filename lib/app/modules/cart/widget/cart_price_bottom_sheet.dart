import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:text_transformation_animation/text_transformation_animation.dart';

import '../../../data/helpers/currency_helper.dart';
import '../../../libraries/icons/icons_font.dart';

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

    TextStyle textStyle = TypographyStyle.bodyRegularLarge;

    TextStyle shippingStyle = TypographyStyle.bodyRegularLarge;

    TextStyle freeShippingStyle =
        TypographyStyle.bodyRegularLarge.copyWith(color: success500);

    TextStyle priceTextStyle = TypographyStyle.bodyRegularLarge.copyWith(
      fontWeight: FontWeight.w500,
    );
    TextStyle totalPriceStyle = TypographyStyle.bodyRegularLarge
        .copyWith(fontWeight: FontWeight.w700, fontSize: 20);

    double separationHeight = 12;

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
              Text(
                'Resumen de compra',
                style: TypographyStyle.bodyBlackLarge.copyWith(
                  color: neutral950,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Productos (',
                    style: textStyle,
                  ),
                  // Solo anima si hay un cambio en productsQuantity
                  if (widget.productsQuantity == previousQuantity)
                    Text(
                      widget.productsQuantity.toString(),
                      style: textStyle,
                    )
                  else
                    TextTransformationAnimation(
                      text: widget.productsQuantity.toString(),
                      duration: textAnimationDuration,
                      alphabet: numberAlphabet,
                      style: textStyle,
                    ),
                  Text(
                    ')',
                    style: textStyle,
                  ),
                  Spacer(),
                  // Solo anima si hay un cambio en productsPrices
                  if (widget.productsPrices == previousPrices)
                    Text(
                      priceStr,
                      style: priceTextStyle,
                    )
                  else
                    TextTransformationAnimation(
                      text: priceStr,
                      duration: textAnimationDuration,
                      alphabet: moneyAlphabet,
                      style: priceTextStyle,
                    ),
                ],
              ),
              SizedBox(height: separationHeight),
              Row(
                children: [
                  Text(
                    'Envío',
                    style: textStyle,
                  ),
                  Spacer(),
                  Text(
                    shippingStr,
                    style: shippingStyle,
                  ),
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
                        if (widget.productsPoints == previousPoints)
                          Text(
                            '${widget.productsPoints} puntos',
                            style: TypographyStyle.bodyBlackMedium,
                          )
                        else
                          Row(
                            children: [
                              TextTransformationAnimation(
                                text: widget.productsPoints.toString(),
                                duration: textAnimationDuration,
                                alphabet: numberAlphabet,
                                style: TypographyStyle.bodyBlackMedium,
                              ),
                              Text(
                                ' puntos',
                                style: TypographyStyle.bodyBlackMedium,
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                'Total a pagar',
                style: textStyle,
              ),
              Spacer(),
              // Solo anima si hay un cambio en el precio total
              if (totalPrice == (previousShipping ?? 0) + (previousPrices ?? 0))
                Text(
                  totalPriceStr,
                  style: totalPriceStyle,
                )
              else
                TextTransformationAnimation(
                  text: totalPriceStr,
                  duration: textAnimationDuration,
                  style: totalPriceStyle,
                  alphabet: moneyAlphabet,
                ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
