import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../controllers/favorites_controller.dart';
import '../widgets/favorites_card.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favoritos',
          style: TypographyStyle.bodyBlackLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => controller.userProductController.listProductFavorite.isNotEmpty
              ? MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  itemCount: controller
                      .userProductController.listProductFavorite.length,
                  itemBuilder: (context, index) {
                    return FavoritesCard(
                      userProductModel: controller
                          .userProductController.listProductFavorite[index],
                    );
                  },
                )
              : Center(child: const Text('no data')),
        ),
      ),
    );
  }
}
