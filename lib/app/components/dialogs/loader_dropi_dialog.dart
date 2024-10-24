import 'dart:ui';

import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LoaderDropiDialog extends StatelessWidget {
  const LoaderDropiDialog({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();

    return Material(
      color: Colors.transparent,
      child: Obx(
        () => AbsorbPointer(
          absorbing: !mainController.dropiDialogIsError.value,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 26, sigmaY: 26),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  crossFadeState: mainController.dropiDialog.value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Container(
                    color: !mainController.dropiDialogIsError.value
                        ? Colors.orange[800]!.withOpacity(0.5)
                        : Colors.red[900]!.withOpacity(0.5),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  secondChild: Container(
                    color: !mainController.dropiDialogIsError.value
                        ? Colors.green[800]!.withOpacity(0.5)
                        : Colors.red[900]!.withOpacity(0.5),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Center(
                child: Hero(
                  tag: 'logo',
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedCrossFade(
                          duration: const Duration(milliseconds: 500),
                          crossFadeState: mainController.dropiDialog.value
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          firstChild: !mainController.dropiDialogIsError.value
                              ? Shimmer.fromColors(
                                  baseColor: Colors.orange,
                                  highlightColor: Colors.yellowAccent,
                                  child: SvgPicture.asset(
                                    'assets/svg/dropi.svg',
                                    width: 140,
                                  ),
                                )
                              : SvgPicture.asset(
                                  'assets/svg/dropi.svg',
                                  width: 180,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.red,
                                    BlendMode.srcIn,
                                  ),
                                ),
                          secondChild: !mainController.dropiDialogIsError.value
                              ? Shimmer.fromColors(
                                  baseColor: Colors.green,
                                  highlightColor: Colors.greenAccent,
                                  child: SvgPicture.asset(
                                    'assets/svg/logo.svg',
                                    width: 180,
                                  ),
                                )
                              : SvgPicture.asset(
                                  'assets/svg/logo.svg',
                                  width: 180,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.red,
                                    BlendMode.srcIn,
                                  ),
                                ),
                        ),

                        AnimatedCrossFade(
                          duration: const Duration(milliseconds: 500),
                          crossFadeState: mainController.dropiDialog.value
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          firstChild: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              "Conectando con dropi",
                              textAlign: TextAlign.center,
                              style: TypographyStyle.bodyBlackLarge.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          secondChild: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              "Conectando con Estrellas 2.0",
                              textAlign: TextAlign.center,
                              style: TypographyStyle.bodyBlackLarge.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),

                        // if (title != null && message != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            mainController.dropiMessage.value,
                            textAlign: TextAlign.center,
                            style: TypographyStyle.bodyRegularMedium
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        AnimatedCrossFade(
                          duration: const Duration(milliseconds: 500),
                          crossFadeState:
                              mainController.dropiDialogIsError.value
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                          firstChild: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  'Ocurrió un error',
                                  textAlign: TextAlign.center,
                                  style: TypographyStyle.h4Mobile.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.redAccent[100]),
                                ),
                                const SizedBox(height: 22),
                                Text(
                                  '¿Qué pasó?',
                                  textAlign: TextAlign.center,
                                  style: TypographyStyle.h4Mobile
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 4),
                                Card(
                                  color: Colors.red[800],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 16),
                                    child: Column(
                                      children: [
                                        SelectableText(
                                          mainController.dropiDialogError.value,
                                          textAlign: TextAlign.center,
                                          style: TypographyStyle
                                              .bodyRegularMedium
                                              .copyWith(
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 26),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white, // Fondo blanco
                                    foregroundColor: Colors.red, // Texto rojo
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // Si deseas bordes redondeados
                                    ),
                                    padding: EdgeInsets.all(
                                        8), // Padding para el botón
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    child: Text(
                                      'Salir',
                                      textAlign: TextAlign.center,
                                      style: TypographyStyle.bodyBlackLarge
                                          .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors
                                            .red, // Texto rojo (si es necesario)
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          secondChild: const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
