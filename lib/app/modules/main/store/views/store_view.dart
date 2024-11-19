import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../../components/appbar/estrellas_appbar.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../libraries/icons/icons_font.dart';
import '../../../../themes/styles/colors.dart';
import '../../widgets/bottombar.dart';
import '../controllers/store_controller.dart';
import '../widgets/catalog_card.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: EstrellasAppbar(
        title: 'Mís catálogos',
        withBackButton: false,
      ),
      floatingActionButton: Button(
        onPressed: () {},
        style: ButtonStyles.secondaryCirlce,
        child: CircleAvatar(
          backgroundColor: primaryBase,
          radius: 24,
          child: Icon(
            Icons.add,
            size: 32,
          ),
        ),
      ),
      bottomNavigationBar: Bottombar(
        viewSelected: 3,
        isDarkTheme: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Obx(
          () => controller.userProductController.listUserCatalogs.isNotEmpty
              ? MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  itemCount:
                      controller.userProductController.listUserCatalogs.length,
                  itemBuilder: (context, index) {
                    return CatalogCard(
                      catalogModel: controller
                          .userProductController.listUserCatalogs[index],
                    );
                  },
                )
              : Center(child: const Text('no data')),
        ),
      ),
    );
  }
}
