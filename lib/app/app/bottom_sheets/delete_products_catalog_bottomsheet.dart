import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/modules/auth/email_verification/controllers/email_verification_controller.dart';
import 'package:flutter_estrellas/app/modules/catalog_details/controllers/catalog_details_controller.dart';
import 'package:flutter_estrellas/app/modules/main/account/controllers/account_controller.dart';
import 'package:flutter_estrellas/app/modules/main/home/controllers/home_controller.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../components/buttons/buttons.dart';
import '../../components/buttons/progress_button.dart';
import '../dialogs/delete/components/animated_border_painter.dart';
import '../dialogs/delete/components/gap.dart';
import '../dialogs/delete/components/progress_button.dart';
import '../dialogs/delete/util/constants.dart';
import 'widgets/title_with_close_button.dart';

class DeleteProductsCatalogBottomsheet extends StatefulWidget {
  const DeleteProductsCatalogBottomsheet({super.key});

  @override
  State<DeleteProductsCatalogBottomsheet> createState() =>
      _DeleteProductsCatalogBottomsheetState();
}

class _DeleteProductsCatalogBottomsheetState
    extends State<DeleteProductsCatalogBottomsheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double gradientProgress = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogDetailsController>(
      id: 'bottomsheet',
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(kBorderRadius)),
          child: CustomPaint(
            painter: AnimatedBorderPainter(animation: _controller),
            child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: gradientProgress),
                duration: const Duration(seconds: 1),
                builder: (_, progress, child) {
                  return SafeArea(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              white,
                              Color.lerp(white, kPrimaryColor.withOpacity(0.2),
                                  progress)!,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: error500,
                            ),
                            child: const Icon(
                              Icons.priority_high_outlined,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            '¿Seguro que quieres eliminar\neste contenido del catálogo?',
                            style: TypographyStyle.h3Mobile,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Perderás el contenido guardado en\nel catálogo ${controller.catalogModel.name}',
                            style: TypographyStyle.bodyRegularMedium,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 28),
                          Button(
                            style: ButtonStyles.primary,
                            onPressed: () {
                              // Get.back();
                              // controller.deleteProductsInCatalog();
                            },
                            label: 'Sí',
                          ),
                          SizedBox(height: 28),
                          GestureDetector(
                            onTapDown: (_) {
                              _controller.forward();

                              setState(() {
                                gradientProgress = 1.0;
                              });
                            },
                            onTapUp: (_) {
                              _controller.reverse();

                              setState(() {
                                gradientProgress = 0.0;
                              });
                            },
                            onTapCancel: () {
                              _controller.reverse();

                              setState(() {
                                gradientProgress = 0.0;
                              });
                            },
                            child: ProgressAnimatedButton(
                              onPressed: () {},
                              label: 'asdasd',
                              size: const Size(250, kButtonHeight),
                              progress: progress,
                            ),
                          ),
                          gapY(16),
                          Button(
                            style: ButtonStyles.secondary,
                            onPressed: Get.back,
                            label: 'No',
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
        //   return Container(
        //     width: double.infinity,
        //     child: Stack(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.all(16),
        //           child: Column(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               SizedBox(height: 16),
        //               Icon(
        //                 EstrellasIcons.infoFill,
        //                 color: error500,
        //                 size: 44,
        //               ),
        //               SizedBox(height: 16),
        //               Text(
        //                 '¿Seguro que quieres eliminar\neste contenido del catálogo?',
        //                 style: TypographyStyle.h3Mobile,
        //               ),
        //               SizedBox(height: 16),
        //               Text(
        //                 'Perderás el contenido guardado en\nel catálogo ${controller.catalogModel.name}',
        //                 style: TypographyStyle.bodyRegularMedium,
        //                 textAlign: TextAlign.center,
        //               ),
        //               SizedBox(height: 28),
        //               GestureDetector(
        //                 onTapDown: (_) {
        //                   _controller.forward();

        //                   setState(() {
        //                     gradientProgress = 1.0;
        //                   });
        //                 },
        //                 onTapUp: (_) {
        //                   _controller.reverse();

        //                   setState(() {
        //                     gradientProgress = 0.0;
        //                   });
        //                 },
        //                 onTapCancel: () {
        //                   _controller.reverse();

        //                   setState(() {
        //                     gradientProgress = 0.0;
        //                   });
        //                 },
        //                 child: ProgressButton(
        //                   size: const Size(250, 350),
        //                   progress: progress,
        //                 ),
        //               ),
        //               SizedBox(height: 24),
        //               Button(
        //                 style: ButtonStyles.secondary,
        //                 onPressed: Get.back,
        //                 label: 'No',
        //               ),
        //             ],
        //           ),
        //         ),
        //         TitleWithCloseButton(title: ''),
        //       ],
        //     ),
        //   );
      },
    );
  }
}
