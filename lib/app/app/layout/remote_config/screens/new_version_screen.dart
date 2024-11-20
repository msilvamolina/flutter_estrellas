import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/layout/remote_config/remote_config_controller.dart';
import 'package:flutter_estrellas/app/components/buttons/buttons.dart';
import 'package:get/get.dart';

import '../../../../themes/styles/typography.dart';

class NewVersionScreen extends StatelessWidget {
  const NewVersionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/update.png';

    return GetBuilder<RemoteConfigController>(
      builder: (controller) {
        return Stack(
          children: [
            GestureDetector(
              onTap: controller.skipVersion,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white.withOpacity(
                      0), // Ajusta la opacidad para un mejor efecto
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Scaffold(
                    body: Stack(
                      children: [
                        Positioned(
                          right: -80,
                          top: 80,
                          child: Opacity(
                            opacity: 0.3,
                            child: Image.asset(
                              image,
                              width: 320,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Spacer(),
                              Image.asset(
                                image,
                                width: 100,
                              ),
                              SizedBox(height: 20),
                              Text(
                                '¡Nueva versión disponible!',
                                style: TypographyStyle.bodyBlackLarge.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Actualiza tu app para disfrutar de nuevas funcionalidades y mejoras.\n\nGracias por ser parte de nuestra comunidad.',
                                style:
                                    TypographyStyle.bodyRegularLarge.copyWith(),
                              ),
                              SizedBox(height: 22),
                              Button(
                                label: 'Actualizar ahora',
                                onPressed: () {},
                                style: ButtonStyles.primary,
                              ),
                              SizedBox(height: 16),
                              Button(
                                label: 'Más tarde',
                                onPressed: controller.skipVersion,
                                style: ButtonStyles.secondary,
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
