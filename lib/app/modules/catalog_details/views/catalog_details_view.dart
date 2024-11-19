import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/components/buttons/buttons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../components/cards/video_product_card.dart';
import '../../../routes/app_pages.dart';
import '../controllers/catalog_details_controller.dart';

class CatalogDetailsView extends GetView<CatalogDetailsController> {
  const CatalogDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogDetailsController>(
      id: 'view',
      builder: (_) {
        return Scaffold(
          appBar: EstrellasAppbar(
            title: controller.catalogModel.name,
            actions: [
              Button(
                label: controller.isSelectMode ? 'Cancelar' : 'Seleccionar',
                onPressed: controller.onPressedSelectMode,
                style: ButtonStyles.secondaryText,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              itemCount: controller.catalogModel.videos!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.toNamed(
                    Routes.PRODUCT_DETAILS,
                    arguments: controller.catalogModel.videos![index],
                  ),
                  child: VideoProductCard(
                    videoProductModel: controller.catalogModel.videos![index],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
