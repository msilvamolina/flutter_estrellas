import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/components/buttons/buttons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../components/cards/video_product_card.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/styles/colors.dart';
import '../controllers/catalog_details_controller.dart';
import '../widgets/catalog_select_bottombar.dart';

class CatalogDetailsView extends GetView<CatalogDetailsController> {
  const CatalogDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 2;

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
          bottomNavigationBar: controller.isSelectMode
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SafeArea(
                    child: CatalogSelectBottombar(),
                  ),
                )
              : null,
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              itemCount: controller.catalogModel.videos!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (controller.isSelectMode) {
                      controller.onProductPressed(
                          controller.catalogModel.videos![index]);
                    } else {
                      Get.toNamed(
                        Routes.PRODUCT_DETAILS,
                        arguments: controller.catalogModel.videos![index],
                      );
                    }
                  },
                  child: Stack(
                    children: [
                      VideoProductCard(
                        videoProductModel:
                            controller.catalogModel.videos![index],
                      ),
                      if (controller.isSelectMode)
                        Positioned(
                          top: size - 68,
                          right: 14,
                          child: Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(16),
                            child: SvgPicture.asset(
                              controller.isProductInCatalog(
                                      controller.catalogModel.videos![index])
                                  ? 'assets/svg/CheckboxActive.svg'
                                  : 'assets/svg/Checkbox.svg',
                              width: 22,
                            ),
                          ),
                        ),
                    ],
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
