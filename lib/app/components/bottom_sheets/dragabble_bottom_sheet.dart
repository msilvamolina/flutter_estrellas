import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../app/bottom_sheets/catalogs_bottomsheet.dart';

enum BottomSheetTypes {
  catalog,
}

class DraggableBottomSheet extends StatelessWidget {
  const DraggableBottomSheet({required this.type, super.key});
  final BottomSheetTypes type;

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 1.0,
        builder: (context, scrollController) {
          return Material(
            color: Colors.transparent,
            child: Container(
              color:
                  mainController.isThemeModeDark ? Colors.black : Colors.white,
              child: getBottomSheet(type, scrollController),
            ),
          );
        },
      ),
    );
  }

  Widget getBottomSheet(
      BottomSheetTypes type, ScrollController scrollController) {
    switch (type) {
      case BottomSheetTypes.catalog:
        return CatalogsBottomsheet(scrollController: scrollController);
      default:
        return SizedBox.shrink();
    }
  }
}
