import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';
import '../widgets/product_appbar.dart';
import '../widgets/product_main_header.dart';
import '../widgets/product_sticky_content.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Detalle de producto',
              style: TypographyStyle.bodyBlackLarge,
            ),
          ),
          body: CustomScrollView(
            shrinkWrap: true,
            slivers: <Widget>[
              ProductMainHeader(),
              ProductStickyContent(),
            ],
          ),
        ),
      );
}
