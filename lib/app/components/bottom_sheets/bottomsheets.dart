import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/bottom_sheets/static_bottom_seet.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'dragabble_bottom_sheet.dart';
import 'types.dart';

class Bottomsheets {
  Bottomsheets._();

  static void draggableBottomSheet(BottomSheetTypes type) {
    showCupertinoModalBottomSheet(
      context: Get.context!,
      isDismissible: true,
      enableDrag: true,
      shadow: BoxShadow(color: Colors.transparent),
      barrierColor: Colors.black.withOpacity(0.5),
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableBottomSheet(type: type),
    );
  }

  static void staticBottomSheet(BottomSheetTypes type) {
    showMaterialModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      expand: false,
      context: Get.context!,
      backgroundColor: Colors.transparent,
      builder: (context) => StaticBottomSeet(type: type),
    );
  }
}
