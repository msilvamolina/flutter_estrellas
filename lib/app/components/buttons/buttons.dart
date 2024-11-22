import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/buttons/widgets/secondary_textbutton.dart';

import 'widgets/destructive_button.dart';
import 'widgets/primary_button.dart';
import 'widgets/secondary_button.dart';
import 'widgets/secondary_circle_button.dart';
import 'widgets/secondary_link.dart';

enum ButtonStyles {
  primary,
  secondary,
  secondaryText,
  secondaryLink,
  secondaryCirlce,
  destructive,
}

class Button extends StatelessWidget {
  const Button({
    required this.onPressed,
    required this.style,
    this.label,
    this.child,
    this.image,
    super.key,
  });

  final Function()? onPressed;
  final String? label;
  final Widget? child;
  final Widget? image;
  final ButtonStyles style;

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case ButtonStyles.primary:
        return PrimaryButton(
          onPressed: onPressed,
          label: label!,
          isLoaderButton: false,
        );
      case ButtonStyles.secondary:
        return SecondaryButton(
          image: image,
          onPressed: onPressed,
          label: label!,
          isLoaderButton: false,
        );
      case ButtonStyles.secondaryText:
        return SecondaryTextbutton(
          onPressed: onPressed,
          label: label!,
        );
      case ButtonStyles.secondaryLink:
        return SecondaryLink(
          onPressed: onPressed,
          label: label!,
        );
      case ButtonStyles.secondaryCirlce:
        return SecondaryCircleButton(
          onPressed: onPressed,
          child: child!,
        );
      case ButtonStyles.destructive:
        return DestructiveButton(
          onPressed: onPressed,
          label: label!,
          isLoaderButton: false,
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
