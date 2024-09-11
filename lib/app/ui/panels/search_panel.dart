import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class SearchPanel extends GetView<MainController> {
  const SearchPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.viewSearch.value,
        child: Container(
          color: Colors.pink,
          width: 350,
          height: 300,
          child: Text('Search'),
        ),
      ),
    );
  }
}
