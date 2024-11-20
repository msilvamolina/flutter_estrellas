import 'package:flutter/material.dart';

import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';

class SecondaryTextbutton extends StatelessWidget {
  const SecondaryTextbutton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final Function()? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: InkRipple.splashFactory, // Tipo de splash (opcional)
        backgroundColor: Colors.transparent,
        overlayColor: secondaryBase, // Color de texto, // Color del splash
        // Color del splash personalizado
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TypographyStyle.bodyBlackMedium.copyWith(
          color: secondaryBase,
        ),
      ),
    );
  }
}
