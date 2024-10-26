import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes/styles/colors.dart';

class SecondaryCircleButton extends StatelessWidget {
  const SecondaryCircleButton({
    required this.child,
    required this.onPressed,
    super.key,
  });

  final Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(8),
        overlayColor: secondaryBase,
      ),
      child: child,
    );
  }
}
