import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: 'product_info',
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: QuillEditor(
            config: QuillEditorConfig(
              showCursor: false,
              scrollPhysics: NeverScrollableScrollPhysics(),
            ),
            controller: controller.detailsController,
            scrollController: controller.detailsEditorScrollController,
            focusNode: controller.detailsEditorFocusNode,
          ),
        );
      },
    );
  }
}
