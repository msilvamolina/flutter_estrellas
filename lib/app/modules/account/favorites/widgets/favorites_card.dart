import 'package:flutter/material.dart';

import '../../../../data/models/user_product/user_product_model.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({required this.userProductModel, super.key});
  final UserProductModel userProductModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(userProductModel.toString()),
    );
  }
}
