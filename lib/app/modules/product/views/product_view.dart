import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'package:get/get.dart';

import '../../../components/layouts/dialog_layout.dart';
import '../../../themes/styles/colors.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                context,
              ),
              sliver: SliverAppBar(
                expandedHeight: 510,
                centerTitle: true,
                pinned: true,
                elevation: 0,
                forceElevated: innerBoxIsScrolled,
                leading:
                    IconButton(onPressed: Get.back, icon: Icon(Icons.close)),
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    // Determinar si la barra está colapsada
                    final double collapseOffset = constraints.biggest.height;
                    final bool isCollapsed =
                        collapseOffset <= (kToolbarHeight + 60);

                    return FlexibleSpaceBar(
                      centerTitle: true,
                      title: isCollapsed
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 46, right: 16),
                              child: Text(
                                'Bolso femenino cuero y tiras metálicas Bolso femenino cuero y tiras metálicas',
                                style: TypographyStyle.bodyBlackLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : null, // Solo mostrar título cuando esté colapsado
                      background: Image.asset(
                        'assets/images/product.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
          body: Text('asdad'),
          // SingleChildScrollView(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Image.asset('assets/images/product.png'),
          //       Text('peps'),
          //     ],
          //   ),
        ),
      ),
    );
  }
}
