import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../themes/styles/typography.dart';

class CheckPasswordCard extends StatelessWidget {
  const CheckPasswordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Tu contraseña debe tener:',
          style: TypographyStyle.bodyBlackLarge.copyWith(
            fontSize: 18,
          ),
        ),
        SizedBox(height: 16),
        iconComprobation(
          'Entre 8 y 20 caracteres',
          null,
        ),
        SizedBox(height: 10),
        iconComprobation(
          '1 mayúscula',
          null,
        ),
        SizedBox(height: 10),
        iconComprobation(
          '1 o más números',
          null,
        ),
        SizedBox(height: 10),
        iconComprobation(
          '1 o más caracteres especiales',
          null,
        ),
      ],
    );
  }

  Widget iconComprobation(String text, bool? value) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/svg/icon-check.svg',
          width: 22,
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TypographyStyle.bodyRegularLarge,
        )
      ],
    );
  }
}
