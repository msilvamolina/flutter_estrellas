import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

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
      body: Obx(
        () => controller.userProductController.listProductFavorite.isNotEmpty
            ? ListView.separated(
                itemCount:
                    controller.userProductController.listProductFavorite.length,
                itemBuilder: (context, index) {
                  return FavoritesCard(
                    userProductModel: controller
                        .userProductController.listProductFavorite[index],
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              )
            : Center(child: const Text('no data')),
      ),
    );
  }
}
