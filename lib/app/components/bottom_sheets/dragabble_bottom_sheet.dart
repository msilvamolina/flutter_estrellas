import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../app/bottom_sheets/catalogs_bottomsheet.dart';
import 'types.dart';

class DraggableBottomSheet extends StatelessWidget {
  const DraggableBottomSheet(
      {required this.type, required this.scrollController, super.key});
  final BottomSheetTypes type;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: Material(
          color: Colors.transparent,
          child: Container(
            color: mainController.isThemeModeDark ? Colors.black : Colors.white,
            child: getBottomSheet(type, scrollController),
          ),
        ),
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
