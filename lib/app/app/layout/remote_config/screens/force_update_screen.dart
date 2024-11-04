import 'package:flutter/material.dart';

import '../../../../components/buttons/buttons.dart';
import '../../../../themes/styles/typography.dart';

class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/update.png';
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                    'Actualización necesaria',
                    style: TypographyStyle.bodyBlackLarge
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Para continuar usando la app, necesitas instalar esta nueva versión que incluye importantes mejoras y correcciones.',
                    style: TypographyStyle.bodyRegularLarge.copyWith(),
                  ),
                  SizedBox(height: 22),
                  Button(
                    label: 'Actualizar ahora',
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
