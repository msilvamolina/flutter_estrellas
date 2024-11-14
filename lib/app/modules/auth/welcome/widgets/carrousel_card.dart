import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/carrousel/carrousel_model.dart';

class CarrouselCard extends StatelessWidget {
  const CarrouselCard({required this.element, super.key});

  final CarrouselModel element;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(element.image),
        ],
      ),
    );
  }
}
