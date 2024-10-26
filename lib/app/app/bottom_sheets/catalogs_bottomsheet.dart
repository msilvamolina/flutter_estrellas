import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/data/models/user_catalog/user_catalog_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/buttons/buttons.dart';
import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';
import 'widgets/product_card.dart';
import 'widgets/title_with_close_button.dart';

class CatalogsBottomsheet extends StatelessWidget {
  const CatalogsBottomsheet({required this.scrollController, super.key});

  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProductController>(
      id: 'catalog_bottom_sheet',
      builder: (controller) {
        ProductFirebaseLiteModel product =
            controller.productCatalogBottomSheet!;
        return ListView(
          controller: scrollController,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TitleWithCloseButton(title: ''),
                  ProductCard(
                    imageUrl: product.thumbnail ?? '',
                    title: product.name ?? '',
                    message: 'Guardado en privado',
                    isProductoInCatalog: true,
                    addFunction: null,
                    removeFunction: null,
                  ),
                  SizedBox(height: 6),
                  DottedLine(
                    dashLength: 7,
                    dashColor: neutral400,
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Catálogos',
                              style: TypographyStyle.h4Mobile.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Button(
                              style: ButtonStyles.secondaryText,
                              label: 'Nuevo catálogo',
                              onPressed: controller.closeAndOpenCreateCatalog,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  for (UserCatalogModel element in controller.listUserCatalogs)
                    ProductCard(
                      imageUrl: element.imageUrl,
                      title: element.name,
                      message:
                          '${element.products?.length ?? 0} ${(element.products?.length ?? 0) == 1 ? 'Producto' : 'Productos'}',
                      isProductoInCatalog:
                          controller.isProductoInCatalog(element, product),
                      addFunction: () => controller.addProductToCatalog(
                        element,
                        product,
                        true,
                      ),
                      removeFunction: () => controller.addProductToCatalog(
                        element,
                        product,
                        false,
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
