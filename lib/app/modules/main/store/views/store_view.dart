import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../components/appbar/estrellas_appbar.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../libraries/icons/icons_font.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../catalog_details/widgets/catalog_select_bottombar.dart';
import '../../widgets/bottombar.dart';
import '../controllers/store_controller.dart';
import '../widgets/catalog_bottombar.dart';
import '../widgets/catalog_card.dart';
import '../widgets/catalog_empty_state.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({super.key});
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 2;

    return GetBuilder<StoreController>(
        id: 'view',
        builder: (_) {
          return Scaffold(
            extendBody: true,
            appBar: EstrellasAppbar(
              title: 'Mís catálogos',
              withBackButton: false,
              actions: [
                Button(
                  label: controller.isSelectMode ? 'Cancelar' : 'Seleccionar',
                  onPressed: controller.onPressedSelectMode,
                  style: ButtonStyles.secondaryText,
                )
              ],
            ),
            floatingActionButton: Obx(
              () => controller.userProductController.listUserCatalogs.isNotEmpty
                  ? !controller.isSelectMode
                      ? Button(
                          onPressed: controller.openAddCatalogBottomSheet,
                          style: ButtonStyles.secondaryCirlce,
                          child: CircleAvatar(
                            backgroundColor: primaryBase,
                            radius: 24,
                            child: Icon(
                              Icons.add,
                              size: 32,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: SafeArea(
                            child: CatalogBottombar(),
                          ),
                        )
                  : SizedBox.shrink(),
            ),
            bottomNavigationBar: Bottombar(
              viewSelected: 3,
              isDarkTheme: false,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: Obx(
                () =>
                    controller.userProductController.listUserCatalogs.isNotEmpty
                        ? MasonryGridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2,
                            itemCount: controller
                                .userProductController.listUserCatalogs.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (controller.isSelectMode) {
                                    controller.onProductPressed(
                                      controller.userProductController
                                          .listUserCatalogs[index],
                                    );
                                  } else {
                                    Get.toNamed(
                                      Routes.CATALOG_DETAILS,
                                      arguments: controller
                                          .userProductController
                                          .listUserCatalogs[index],
                                    );
                                  }
                                },
                                child: Stack(
                                  children: [
                                    CatalogCard(
                                      onSharePressed: () => controller
                                          .userProductController
                                          .goToSellCatalog(controller
                                              .userProductController
                                              .listUserCatalogs[index]),
                                      catalogModel: controller
                                          .userProductController
                                          .listUserCatalogs[index],
                                    ),
                                    if (controller.isSelectMode)
                                      Positioned(
                                        top: size - 68,
                                        right: 14,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12))),
                                          margin: EdgeInsets.all(8),
                                          padding: EdgeInsets.all(16),
                                          child: SvgPicture.asset(
                                            controller.isProductInCatalog(
                                                    controller
                                                        .userProductController
                                                        .listUserCatalogs[index])
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
                          )
                        : CatalogEmptyState(),
              ),
            ),
          );
        });
  }
}
