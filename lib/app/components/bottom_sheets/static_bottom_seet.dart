import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../app/bottom_sheets/catalogs_bottomsheet.dart';
import '../../app/bottom_sheets/new_catalog_bottomsheet.dart';
import 'types.dart';

class StaticBottomSeet extends StatelessWidget {
  const StaticBottomSeet({required this.type, super.key});
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
      case BottomSheetTypes.newCatalog:
        return NewCatalogBottomsheet(scrollController: scrollController);
      default:
        return SizedBox.shrink();
    }
  }
}
