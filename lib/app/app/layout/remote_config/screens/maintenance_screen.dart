import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import '../../../../components/buttons/buttons.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/mantenimiento.png';
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: -60,
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
              padding: const EdgeInsets.all(16),
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
                    'Mantenimiento',
                    style: TypographyStyle.bodyBlackLarge
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Estamos realizando algunas mejoras en este momento, lo resolveremos pronto.\n\n¡Gracias por tu paciencia!',
                    style: TypographyStyle.bodyRegularLarge.copyWith(),
                  ),
                  SizedBox(height: 22),
                  Button(
                    label: 'Contáctanos',
                    onPressed: () {},
                    style: ButtonStyles.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
