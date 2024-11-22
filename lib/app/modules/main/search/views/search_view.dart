import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../../components/cards/video_product_card.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/typography.dart';
import '../../widgets/bottombar.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchViewController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottombar(
        viewSelected: 2,
        isDarkTheme: false,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Obx(
          () => Container(
            decoration: BoxDecoration(
              color: Colors.grey[200], // Fondo gris
              borderRadius: BorderRadius.circular(16), // Bordes redondeados
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.searchController,
                    onChanged: (value) {
                      controller.filterList(value);
                    },
                    cursorColor: neutral900,
                    decoration: InputDecoration(
                      hintText: 'Buscar',
                      hintStyle: TypographyStyle.bodyRegularMedium
                          .copyWith(color: neutral900),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        EstrellasIcons.search,
                        color: neutral900,
                      ),
                      contentPadding:
                          const EdgeInsets.only(top: 11), // Padding solo arriba
                    ),
                    style: TypographyStyle.bodyBlackLarge,
                  ),
                ),
                if (controller.showCancelButton.value)
                  IconButton(
                    icon: Icon(EstrellasIcons.xCircle, color: neutral900),
                    onPressed: () {
                      controller.searchController.clear();
                      controller.filterList('');
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => controller.filteredList.isNotEmpty
              ? MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  itemCount: controller.filteredList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          Routes.VIDEO_DETAILS,
                          arguments: controller.filteredList[index],
                        );
                      },
                      child: VideoProductCard(
                        videoProductModel: controller.filteredList[index],
                      ),
                    );
                  },
                )
              : const Center(child: Text('No hay resultados')),
        ),
      ),
    );
  }
}
