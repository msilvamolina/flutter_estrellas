import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/carrousel/carrousel_model.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

class CarrouselCard extends StatelessWidget {
  const CarrouselCard({required this.element, super.key});

  final CarrouselModel element;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(element.image),
        SizedBox(height: 16),
        Text(
          element.title,
          style: TypographyStyle.bodyBlackLarge3,
        ),
        SizedBox(height: 8),
        Text(
          element.subtitle,
          style: TypographyStyle.bodyRegularLarge,
        ),
      ],
    );
  }
}
