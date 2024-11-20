import 'package:flutter/material.dart';

import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';

class SecondaryLink extends StatelessWidget {
  const SecondaryLink({
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
        style: TypographyStyle.bodyBlackLarge.copyWith(
          color: secondaryBase,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
