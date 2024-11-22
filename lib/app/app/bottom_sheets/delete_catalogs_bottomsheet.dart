import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/modules/auth/email_verification/controllers/email_verification_controller.dart';
import 'package:flutter_estrellas/app/modules/catalog_details/controllers/catalog_details_controller.dart';
import 'package:flutter_estrellas/app/modules/main/account/controllers/account_controller.dart';
import 'package:flutter_estrellas/app/modules/main/home/controllers/home_controller.dart';
import 'package:flutter_estrellas/app/modules/main/store/controllers/store_controller.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../components/buttons/buttons.dart';
import '../../components/buttons/progress_animated_button.dart';

import 'widgets/animated_border_painter.dart';
import 'widgets/title_with_close_button.dart';

class DeleteCatalogsBottomsSheet extends StatefulWidget {
  const DeleteCatalogsBottomsSheet({super.key});

  @override
  State<DeleteCatalogsBottomsSheet> createState() =>
      _DeleteCatalogsBottomsSheetState();
}

class _DeleteCatalogsBottomsSheetState extends State<DeleteCatalogsBottomsSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double gradientProgress = 0.0;
  bool hasExecutedAction = false;
  double kBorderRadius = 24;
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

  void executeAction(StoreController controller) {
    if (!hasExecutedAction) {
      hasExecutedAction = true;

      Get.back();
      controller.deleteProductsInCatalog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
      id: 'bottomsheet',
      builder: (controller) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(24)),
              child: CustomPaint(
                painter: AnimatedBorderPainter(animation: _controller),
                child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: gradientProgress),
                    duration: const Duration(seconds: 1),
                    builder: (_, progress, child) {
                      if (progress == 1.0) {
                        Future.microtask(() => executeAction(controller));
                      } else if (progress < 1.0) {
                        hasExecutedAction = false;
                      }
                      return SafeArea(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  white,
                                  Color.lerp(white, error500.withOpacity(0.2),
                                      progress)!,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius)),
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
                                '¿Seguro que quieres eliminar este contenido?',
                                style: TypographyStyle.h3Mobile,
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
                                  label: 'Sí',
                                  holdLabel: 'Mantén presionado para eliminar',
                                  progress: progress,
                                ),
                              ),
                              SizedBox(height: 24),
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
            ),
            TitleWithCloseButton(title: ''),
          ],
        );
      },
    );
  }
}
