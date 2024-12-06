import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/orders_controller.dart';
import '../widgets/order_card.dart';
import '../widgets/order_search_empty_state.dart';
import 'orders_empty_state.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(
        title: 'Órdenes',
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              EstrellasIcons.slidersHorizontal,
            ),
          ),
        ],
      ),
      body: Obx(
        () => controller.userProductController.listOrder.isNotEmpty
            ? Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Fondo gris
                      borderRadius:
                          BorderRadius.circular(16), // Bordes redondeados
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
                              hintText: 'Buscar por ID',
                              hintStyle: TypographyStyle.bodyRegularMedium
                                  .copyWith(color: neutral900),
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                EstrellasIcons.search,
                                color: neutral900,
                              ),
                              contentPadding: const EdgeInsets.only(
                                  top: 11), // Padding solo arriba
                            ),
                            style: TypographyStyle.bodyBlackLarge,
                          ),
                        ),
                        if (controller.showCancelButton.value)
                          IconButton(
                            icon:
                                Icon(EstrellasIcons.xCircle, color: neutral900),
                            onPressed: () {
                              controller.searchController.clear();
                              controller.filterList('');
                            },
                          ),
                      ],
                    ),
                  ),
                  if (controller.filteredList.isNotEmpty)
                    Expanded(
                      child: ListView.separated(
                        itemCount: controller.filteredList.length,
                        itemBuilder: (context, index) {
                          return OrderCard(
                            order: controller.filteredList[index],
                          );
                        },
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: const Divider(
                            color: neutral300,
                          ),
                        ),
                      ),
                    )
                  else
                    OrderSearchEmptyState()
                ],
              )
            : OrdersEmptyState(),
      ),
    );
  }
}
