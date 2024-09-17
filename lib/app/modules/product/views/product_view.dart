import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/layouts/dialog_layout.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Scaffold(
        body: Text('peps'),
      ),
    );
  }
}
