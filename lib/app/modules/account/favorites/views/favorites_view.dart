import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../../components/appbar/estrellas_appbar.dart';
import '../../../../components/cards/video_product_card.dart';
import '../controllers/favorites_controller.dart';
import '../widgets/favorites_empty_state.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(title: 'Favoritos'),
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
                    return GestureDetector(
                      onTap: () => Get.toNamed(
                        Routes.VIDEO_LIST,
                        arguments: [
                          controller.userProductController.listProductFavorite,
                          index
                        ],
                      ),
                      child: VideoProductCard(
                        videoProductModel: controller.userProductController
                            .listProductFavorite[index].video!,
                      ),
                    );
                  },
                )
              : FavoritesEmptyState(),
        ),
      ),
    );
  }
}
