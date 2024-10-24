import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'dragabble_bottom_sheet.dart';

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
}
