import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../libraries/icons/icons_font.dart';
import '../controllers/product_details_controller.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: 'product_info',
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Text(controller.product?.description ?? ''),
        );
      },
    );
  }
}
