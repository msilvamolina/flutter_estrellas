import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../themes/styles/colors.dart';

class WalletOrdersAlert extends StatelessWidget {
  const WalletOrdersAlert({
    required this.orderNumber,
    super.key,
  });

  final int orderNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        border: Border.all(
          width: 1.5,
          color: neutral900,
        ),
        boxShadow: [
          BoxShadow(
            color: info500, // Ajusta el color y opacidad según tu necesidad
            blurRadius: 0, // Tamaño de desenfoque
            offset: Offset(-4, 4), // Posición de la sombra
          ),
        ],
      ),
      child: Card(
        color: white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: Container(
              width: 46,
              height: 46,
              child: Icon(
                EstrellasIcons.receipt,
                size: 38,
                color: info500,
              ),
            ),
            title: Text(
              orderNumber > 0
                  ? 'Tienes $orderNumber órdenes en proceso'
                  : 'Sin órdenes en proceso. ¡Explora productos y crea tu próxima orden!',
              style: TypographyStyle.bodyBlackLarge,
            ),
            trailing: Icon(
              EstrellasIcons.arrowRight,
              size: 24,
              color: neutral900,
            ),
          ),
        ),
      ),
    );
  }
}
