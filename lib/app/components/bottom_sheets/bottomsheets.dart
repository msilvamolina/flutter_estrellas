import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/bottom_sheets/static_bottom_seet.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'dragabble_bottom_sheet.dart';
import 'types.dart';

class Bottomsheets {
  Bottomsheets._();

  static void draggableBottomSheet({
    required BottomSheetTypes type,
    required double initialChildSize,
    required double minChildSize,
    required double maxChildSize,
  }) {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        expand: false,
        builder: (context, scrollController) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: DraggableBottomSheet(
                type: type, scrollController: scrollController),
          );
        },
      ),
    );
  }

  static void staticBottomSheet(BottomSheetTypes type,
      {bool isDismissible = true}) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      isDismissible: isDismissible,
      isScrollControlled: true,
      context: Get.context!,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StaticBottomSeet(type: type),
      ),
    );
  }

  static void customBottomSheet(Widget bottomSheet,
      {bool isDismissible = true}) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      isDismissible: isDismissible,
      isScrollControlled: true,
      context: Get.context!,
      backgroundColor: Colors.transparent,
      builder: (context) => bottomSheet,
    );
  }
}
