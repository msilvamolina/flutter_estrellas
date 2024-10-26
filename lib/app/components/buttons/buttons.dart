import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/buttons/widgets/secondary_textbutton.dart';

import 'widgets/primary_button.dart';

enum ButtonStyles {
  primary,
  secondaryText,
}

class Button extends StatelessWidget {
  const Button({
    required this.onPressed,
    required this.label,
    required this.style,
    super.key,
  });

  final Function()? onPressed;
  final String label;
  final ButtonStyles style;

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case ButtonStyles.primary:
        return PrimaryButton(
          onPressed: onPressed,
          label: label,
          isLoaderButton: false,
        );
      case ButtonStyles.secondaryText:
        return SecondaryTextbutton(
          onPressed: onPressed,
          label: label,
        );
      default:
        return SizedBox.shrink();
    }
  }
}

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    required this.onPressed,
    required this.label,
    required this.style,
    required this.isLoading,
    super.key,
  });

  final Function()? onPressed;
  final String label;
  final ButtonStyles style;
  final bool isLoading;
  @override
  @override
  Widget build(BuildContext context) {
    switch (style) {
      case ButtonStyles.primary:
        return PrimaryButton(
          onPressed: onPressed,
          label: label,
          isLoaderButton: true,
          isLoading: isLoading,
        );
      default:
        return SizedBox.shrink();
    }
  }
}
