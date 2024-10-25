import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:get/get.dart';

import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';

class NewCatalogBottomsheet extends StatelessWidget {
  const NewCatalogBottomsheet({required this.scrollController, super.key});

  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProductController>(
      id: 'new_catalog_bottom_sheet',
      builder: (controller) {
        ProductFirebaseLiteModel product =
            controller.productCatalogBottomSheet!;
        return ListView(
          controller: scrollController,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Crear catálogo'),
                  Text('Input'),
                  Text('Guardar'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
