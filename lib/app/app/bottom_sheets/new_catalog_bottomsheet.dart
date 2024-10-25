import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:get/get.dart';

import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';

class NewCatalogBottomsheet extends StatelessWidget {
  const NewCatalogBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProductController>(
      id: 'new_catalog_bottom_sheet',
      builder: (controller) {
        ProductFirebaseLiteModel product =
            controller.productCatalogBottomSheet!;
        return Material(
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('holis'),
              ],
            ),
          ),
        );
      },
    );
  }
}
