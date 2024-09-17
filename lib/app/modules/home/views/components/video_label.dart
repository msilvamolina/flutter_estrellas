import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/typography.dart';

class VideoLabel extends StatelessWidget {
  const VideoLabel({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter, // Comienza desde abajo
          end: Alignment.topCenter, // Termina arriba
          colors: [
            Colors.black,
            Colors.transparent, // Transparente en la parte superior
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GestureDetector(
          onTap: () => Get.toNamed(Routes.PRODUCT),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/avatar.png',
                    width: 40,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Bolso femenino cuero y tiras metálicas',
                          style: TypographyStyle.bodyRegularMedium
                              .copyWith(color: white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              'Shopi',
                              style: TypographyStyle.bodyBlackSmall
                                  .copyWith(color: white),
                            ),
                            Text(
                              ' • ',
                              style: TypographyStyle.bodyBlackSmall
                                  .copyWith(color: white),
                            ),
                            Text(
                              '619 puntos',
                              style: TypographyStyle.bodyRegularSmall
                                  .copyWith(color: white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10), // Bordes redondeados
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 5.0, sigmaY: 5.0), // Aplicar el desenfoque
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4), // Padding interno
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: neutral500, // Borde blanco
                              width: 1, // Grosor del borde
                            ),
                            color: neutral600
                                .withOpacity(0.6), // Fondo con transparencia
                            borderRadius: BorderRadius.circular(
                                20.0), // Bordes redondeados
                          ),

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/medal.svg',
                                width: 10,
                              ),
                              SizedBox(
                                  width:
                                      4), // Espacio entre el icono y el texto
                              Text(
                                'Puntos: 600', // Texto que muestra los puntos
                                style: TypographyStyle.bodyRegularSmall
                                    .copyWith(color: white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10), // Bordes redondeados
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 5.0, sigmaY: 5.0), // Aplicar el desenfoque
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4), // Padding interno
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: neutral500, // Borde blanco
                              width: 1, // Grosor del borde
                            ),
                            color: neutral600
                                .withOpacity(0.6), // Fondo con transparencia
                            borderRadius: BorderRadius.circular(
                                20.0), // Bordes redondeados
                          ),

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/coins.svg',
                                width: 10,
                              ),
                              SizedBox(
                                  width:
                                      4), // Espacio entre el icono y el texto
                              Text(
                                'Precio: \$40.000', // Texto que muestra los puntos
                                style: TypographyStyle.bodyRegularSmall
                                    .copyWith(color: white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
