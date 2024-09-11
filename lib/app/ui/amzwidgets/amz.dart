import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<T?> showAmzBottomSheet<T>(
  Widget child,
) {
  return showCupertinoModalSheet(
    context: Get.context!,
    builder: (context) => Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Theme.of(Get.context!).iconTheme.color,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        color: Theme.of(Get.context!).cardColor,
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: child,
        ),
      ),
    ),
  );
}
