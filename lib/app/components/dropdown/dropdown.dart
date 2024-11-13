import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';

import '../../themes/styles/colors.dart';
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
          padding: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(
                color: error != null ? errorColor : neutral600, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButton<String>(
            dropdownColor: white,
            value: selectedValue,
            isExpanded: true,
            icon: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                EstrellasIcons.arrowBottom,
              ),
            ),
            underline: const SizedBox.shrink(),
            alignment: AlignmentDirectional.bottomEnd,
            items: [
              // Dropdown item de texto inicial
              DropdownMenuItem<String>(
                value: null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Selecciona una opción',
                    style: TypographyStyle.bodyBlackLarge.copyWith(
                      color: neutral700, // Color de texto gris
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              // Resto de las opciones
              ...values.map<DropdownMenuItem<String>>((OptionDropDown option) {
                return DropdownMenuItem<String>(
                  value: option.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      option.text,
                      style: TypographyStyle.bodyBlackLarge.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
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
