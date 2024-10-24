import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/modules/product/views/description_view.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'package:get/get.dart';

import '../../../components/layouts/dialog_layout.dart';
import '../../../themes/styles/colors.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    double tmbSize = 90;
    bool isIos = false;
    bool isAndroid = false;

    if (!kIsWeb) {
      isIos = Platform.isIOS;
      isAndroid = Platform.isAndroid;
    }
    return DialogLayout(
      child: Scaffold(
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16, vertical: isIos ? 0 : (isAndroid ? 8 : 16)),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shadowColor: controller.mainController.isThemeModeDark
                          ? secondaryLight
                          : secondaryBase,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      foregroundColor: controller.mainController.isThemeModeDark
                          ? Colors.white
                          : Colors.black,
                      side: BorderSide(
                        color: controller.mainController.isThemeModeDark
                            ? neutral700
                            : Colors.black, // Color del borde
                        width: 1, // Ancho del borde
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      child: Text(
                        'Vender',
                        textAlign: TextAlign.center,
                        style: TypographyStyle.bodyRegularLarge
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.userProductController
                          .addToCart(controller.productLite);
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.mainController.isThemeModeDark
                          ? primaryDark
                          : primaryBase,
                      foregroundColor: controller.mainController.isThemeModeDark
                          ? Colors.white
                          : Colors.black,
                      side: BorderSide(
                        color: controller.mainController.isThemeModeDark
                            ? primaryBase
                            : Colors.black, // Color del borde
                        width: 1, // Ancho del borde
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      child: Text(
                        'Comprar',
                        textAlign: TextAlign.center,
                        style: TypographyStyle.bodyRegularLarge
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
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
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
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
                        background: Stack(
                          children: [
                            Hero(
                              tag:
                                  'productHeroTag-${controller.productLite.id}',
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        controller.productLite.thumbnail ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: (controller.mainController
                                                  .isThemeModeDark
                                              ? neutral700
                                              : neutral300)
                                          .withOpacity(0.7), // Borde blanco
                                      width: 1, // Grosor del borde
                                    ),
                                    color: (controller
                                                .mainController.isThemeModeDark
                                            ? neutral900
                                            : neutral100)
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(
                                        16), // Bordes redondeados
                                  ),
                                  height: tmbSize + 16,
                                  child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      SizedBox(width: 16),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Image.asset(
                                          'assets/images/product_tmb1.png',
                                          width: tmbSize,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Image.asset(
                                          'assets/images/product_tmb2.png',
                                          width: tmbSize,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Image.asset(
                                          'assets/images/product_tmb3.png',
                                          width: tmbSize,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Image.asset(
                                          'assets/images/product_tmb1.png',
                                          width: tmbSize,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Image.asset(
                                          'assets/images/product_tmb2.png',
                                          width: tmbSize,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Image.asset(
                                          'assets/images/product_tmb3.png',
                                          width: tmbSize,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Image.asset(
                                          'assets/images/product_tmb1.png',
                                          width: tmbSize,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Image.asset(
                                          'assets/images/product_tmb2.png',
                                          width: tmbSize,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Image.asset(
                                          'assets/images/product_tmb3.png',
                                          width: tmbSize,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],

            body: Column(
              children: [
                SizedBox(height: (isIos) ? 116 : (isAndroid ? 78 : 56)),
                Container(
                  height: 60,
                  child: TabBar(
                    indicatorColor: primaryBase,
                    labelColor: controller.mainController.isThemeModeDark
                        ? secondaryLight
                        : secondaryBase,
                    tabs: [
                      Tab(text: "Descripción"),
                      Tab(text: "Contenido"),
                      Tab(text: "Resumen"),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Contenido de la pestaña "Inicio"
                      DescriptionView(),
                      // Contenido de la pestaña "Favoritos"
                      Center(child: Text('Contenido de Favoritos')),
                      // Contenido de la pestaña "Ajustes"
                      Center(child: Text('Contenido de Ajustes')),
                    ],
                  ),
                ),
              ],
            ),

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
      ),
    );
  }
}
