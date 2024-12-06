import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

class OrderSearchEmptyState extends StatelessWidget {
  const OrderSearchEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 46),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/catalog.png',
            width: 70,
          ),
          SizedBox(height: 26),
          Text(
            'Ups, no encontramos lo\nque buscabas',
            style: TypographyStyle.bodyBlackLarge2
                .copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'Intenta con otra búsqueda o revisa la escritura.\n¡Seguro que encontramos lo que buscas!',
            style: TypographyStyle.bodyRegularLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
