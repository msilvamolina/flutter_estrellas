import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/buttons/buttons.dart';
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
                  productCard(
                    image: product.thumbnail ?? '',
                    title: product.name ?? '',
                    message: 'Guardado en privado',
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(
                        'assets/svg/catalog.svg',
                        width: 16,
                      ),
                    ),
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
                  for (int i = 1; i < 10; i++)
                    InkWell(
                      onTap: () {},
                      child: productCard(
                        image: product.thumbnail ?? '',
                        title: 'Catálogo $i',
                        message: '8 Productos',
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SvgPicture.asset(
                            'assets/svg/PlusCircle.svg',
                            width: 26,
                          ),
                        ),
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

  Widget productCard({
    required String image,
    required String title,
    required String message,
    required Widget icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 24, left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8), // Borde redondeado de 8

            child: Image.network(
              image,
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
                title,
                style: TypographyStyle.bodyBlackLarge,
              ),
              Text(
                message,
                style: TypographyStyle.bodyRegularMedium
                    .copyWith(color: neutral700),
              ),
            ],
          ),
          Spacer(),
          icon,
        ],
      ),
    );
  }
}
