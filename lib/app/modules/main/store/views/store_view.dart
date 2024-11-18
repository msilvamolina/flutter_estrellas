import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../../components/appbar/estrellas_appbar.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../libraries/icons/icons_font.dart';
import '../../../../themes/styles/colors.dart';
import '../../widgets/bottombar.dart';
import '../controllers/store_controller.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => controller.userProductController.listUserCatalogs.isNotEmpty
              ? GridView.count(
                  crossAxisCount: 2, // Número de columnas
                  mainAxisSpacing: 2, // Espaciado entre filas
                  crossAxisSpacing: 2, // Espaciado entre columnas
                  children: List.generate(
                    controller.userProductController.listUserCatalogs.length,
                    (index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            controller
                                .userProductController.listUserCatalogs[index]
                                .toString(),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(child: const Text('no data')),
        ),
      ),
    );
  }
}
