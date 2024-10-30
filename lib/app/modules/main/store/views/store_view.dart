import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/bottombar_layout.dart';
import '../controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottombarLayout(
        viewSelected: 3,
        child: Center(
          child: Text('Store'),
        ),
      ),
    );
  }
}
