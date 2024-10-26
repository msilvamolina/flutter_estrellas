import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';
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

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(8), // Borde redondeado de 8

                          child: Image.network(
                            product.thumbnail ?? '',
                            width: 54,
                            height: 54,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name ?? '',
                              style: TypographyStyle.bodyBlackLarge,
                            ),
                            Text(
                              'Guardado en privado',
                              style: TypographyStyle.bodyRegularMedium
                                  .copyWith(color: neutral700),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SvgPicture.asset(
                            'assets/svg/catalog.svg',
                            width: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26),
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
                            TextButton(
                              onPressed: controller.closeAndOpenCreateCatalog,
                              child: Text('Nuevo catálogo'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     labelText: 'Buscar',
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  // SizedBox(height: 16),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: 4,
                  //   itemBuilder: (context, index) {
                  //     return ListTile(
                  //       onTap: () {
                  //         print('ho;a');
                  //       },
                  //       title: Text('Elemento ${index + 1}'),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
