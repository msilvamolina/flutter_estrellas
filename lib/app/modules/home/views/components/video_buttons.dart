import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../themes/styles/typography.dart';

class VideoButtons extends StatelessWidget {
  VideoButtons({super.key});

  @override
  Widget build(BuildContext context) {
    double iconSize = 34;
    return Column(
      children: [
        Spacer(),
        SvgPicture.asset(
          'assets/svg/BookmarkSimple.svg',
          width: iconSize,
        ),
        SizedBox(height: 4),
        Text('Guardar', style: TypographyStyle.bodyRegularSmall),
        SizedBox(height: 22),
        SvgPicture.asset(
          'assets/svg/Info.svg',
          width: iconSize,
        ),
        SizedBox(height: 4),
        Text('Info', style: TypographyStyle.bodyRegularSmall),
        SizedBox(height: 22),
        SvgPicture.asset(
          'assets/svg/Heart.svg',
          width: iconSize,
        ),
        SizedBox(height: 4),
        Text('220', style: TypographyStyle.bodyRegularSmall),
        SizedBox(height: 22),
        SvgPicture.asset(
          'assets/svg/ShoppingBag.svg',
          width: iconSize,
        ),
        SizedBox(height: 4),
        Text('Comprar', style: TypographyStyle.bodyRegularSmall),
        SizedBox(height: 22),
        SvgPicture.asset(
          'assets/svg/logo.svg',
          width: iconSize,
        ),
        SizedBox(height: 4),
        Text('Vender', style: TypographyStyle.bodyRegularSmall),
      ],
    );
  }
}
