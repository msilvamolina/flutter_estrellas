import 'package:flutter/material.dart';

import '../../themes/styles/typography.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    required this.onPressed,
    required this.label,
    required this.isLoading,
    super.key,
  });

  final Function()? onPressed;
  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isLoading ? onPressed : null,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: !isLoading
            ? Text(
                label,
                textAlign: TextAlign.center,
                style: TypographyStyle.bodyRegularLarge
                    .copyWith(fontWeight: FontWeight.w400),
              )
            : Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
      ),
    );
  }
}
