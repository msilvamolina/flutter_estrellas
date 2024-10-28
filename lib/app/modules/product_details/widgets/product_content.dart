import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/modules/product_details/widgets/content/product_content_product.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../components/buttons/button_circle_svg.dart';
import '../../../components/buttons/buttons.dart';
import '../controllers/product_details_controller.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductContentProduct(),
      ],
    );
  }
}
