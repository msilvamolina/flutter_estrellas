import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../../components/appbar/estrellas_appbar.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../libraries/icons/icons_font.dart';
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
                              return CatalogCard(
                                catalogModel: controller.userProductController
                                    .listUserCatalogs[index],
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
