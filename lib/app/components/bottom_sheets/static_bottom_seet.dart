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
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Material(
        child: SafeArea(
          top: false,
          child: getBottomSheet(type),
        ),
      ),
    );
  }

  Widget getBottomSheet(BottomSheetTypes type) {
    switch (type) {
      case BottomSheetTypes.newCatalog:
        return NewCatalogBottomsheet();
      default:
        return SizedBox.shrink();
    }
  }
}
