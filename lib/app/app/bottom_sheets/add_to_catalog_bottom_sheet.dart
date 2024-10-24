import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_product_controller.dart';

class AddToCatalogBottomSheet extends StatelessWidget {
  const AddToCatalogBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProductController>(
      id: 'add_to_catalog_bottom_sheet',
      builder: (_) {
        return Container(
          height: 200,
          child: Text('holis'),
        );
      },
    );
  }
}
