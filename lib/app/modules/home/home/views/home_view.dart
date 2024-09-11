import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => _buildBody(state),
      onLoading: CircularProgressIndicator().centered(),
      onEmpty: Text('No data found'),
      onError: (error) =>
          Text('error'.toString()).text.red200.make().centered(),
    );
  }

  Widget _buildBody(String? text) {
    return SingleChildScrollView(
      child: Column(
        children: [
          18.heightBox,
          HStack(
            [
              _story(),
              _story(),
              _story(),
              _story(),
              _story(),
              _story(),
              _story(),
              _story(),
              _story(),
              _story(),
            ],
          ).scrollHorizontal(),
        ],
      ),
    );
  }

  Widget _story() {
    return Container(
      margin: EdgeInsets.only(right: 16),
      color: Colors.red,
      width: 180,
      height: 320,
      child: Text('storys'),
    ).box.rounded.make();
  }
}
