import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:get/get.dart';

import '../../app/controllers/main_controller.dart';
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
    required this.label,
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
  final String label;

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();

    Color errorLabelBackgroundColor =
        mainController.isThemeModeDark ? error500 : error50;
    Color errorLabelForegroundColor =
        !mainController.isThemeModeDark ? error500 : error50;

    Color labelBackgroundColor =
        mainController.isThemeModeDark ? secondaryDark : secondaryLight;

    Color labelForegroundColor =
        mainController.isThemeModeDark ? neutral300 : neutral900;

    Color borderColor =
        mainController.isThemeModeDark ? secondaryBase : secondaryBase;

    Color borderColorGrey = neutral600;
    Color errorColor = mainController.isThemeModeDark ? error500 : error900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                    color: error != null ? errorColor : neutral600, width: 1),
                borderRadius: BorderRadius.circular(10),
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
                  ...values
                      .map<DropdownMenuItem<String>>((OptionDropDown option) {
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
            Container(
              margin: EdgeInsets.only(left: 12),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                color: error != null
                    ? errorLabelBackgroundColor
                    : labelBackgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.white, // Color del borde
                  width: 2.0, // Ancho del borde
                ),
              ),
              child: Text(
                label,
                style: TypographyStyle.bodyRegularMedium.copyWith(
                  color: error != null
                      ? errorLabelForegroundColor
                      : labelForegroundColor,
                  fontSize: 14.5,
                ),
              ),
            )
          ],
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
