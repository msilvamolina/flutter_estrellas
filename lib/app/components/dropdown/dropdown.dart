import 'package:flutter/material.dart';

import '../../themes/styles/typography.dart';

class OptionDropDown {
  OptionDropDown({
    required this.text,
    required this.value,
  });

  final String text;
  final String value;
}

class DropDown extends StatelessWidget {
  const DropDown({
    required this.values,
    required this.onChanged,
    this.selectedValue,
    this.error,
    this.expanded = true,
    super.key,
  });

  final String? selectedValue;
  final List<OptionDropDown> values;
  final Function(String?)? onChanged;
  final bool expanded;
  final String? error;
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary.withOpacity(0.5);
    Color errorColor = Theme.of(context).colorScheme.error;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: error != null ? errorColor : primaryColor, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            isExpanded: true,
            underline: const SizedBox.shrink(),
            alignment: AlignmentDirectional.bottomEnd,
            items:
                values.map<DropdownMenuItem<String>>((OptionDropDown option) {
              return DropdownMenuItem<String>(
                value: option.value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(option.text),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              error!,
              style:
                  TypographyStyle.bodyRegularSmall.copyWith(color: errorColor),
            ),
          )
      ],
    );
  }
}
