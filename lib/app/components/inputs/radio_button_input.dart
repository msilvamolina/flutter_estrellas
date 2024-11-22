import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';

class RadioButtonInput extends StatelessWidget {
  const RadioButtonInput({
    required this.formControlName,
    required this.value,
    required this.text,
    super.key,
  });

  final String formControlName;
  final String value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: neutral600),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(vertical: 4),
      child: ReactiveRadioListTile<String>(
        formControlName: formControlName,
        value: value,
        title: Text(
          text,
          style: TypographyStyle.bodyRegularLarge,
        ),
        activeColor: secondaryBase,
        dense: true,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
