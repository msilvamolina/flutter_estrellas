import 'package:flutter/material.dart';

import '../../../../themes/styles/colors.dart';

class ProductCardContainer extends StatelessWidget {
  const ProductCardContainer({required this.child, this.padding, super.key});

  final Widget child;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: padding ?? EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: neutral200,
        borderRadius: BorderRadius.circular(14),
      ),
      width: double.infinity,
      child: child,
    );
  }
}
