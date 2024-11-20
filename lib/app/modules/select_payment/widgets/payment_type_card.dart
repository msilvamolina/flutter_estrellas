import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/models/payments_types/payments_types_model.dart';
import '../../../themes/styles/colors.dart';

class PaymentTypeCard extends StatelessWidget {
  const PaymentTypeCard({
    required this.paymentsTypesModel,
    required this.isSelected,
    this.onTap,
    super.key,
  });

  final PaymentsTypesModel paymentsTypesModel;
  final bool isSelected;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? white : neutral100,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: isSelected
            ? Border.all(
                width: 1.5,
                color: neutral900,
              )
            : null,
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color:
                      secondaryLight, // Ajusta el color y opacidad según tu necesidad
                  blurRadius: 0, // Tamaño de desenfoque
                  offset: Offset(-4, 4), // Posición de la sombra
                ),
              ]
            : null,
      ),
      child: Card(
        color: isSelected ? white : neutral100,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            onTap: onTap,
            leading: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                  color: secondaryLight,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: paymentsTypesModel.image != null
                  ? Center(
                      child: Image.asset(
                        paymentsTypesModel.image!,
                        width: 30,
                      ),
                    )
                  : (paymentsTypesModel.icon != null
                      ? Icon(
                          paymentsTypesModel.icon,
                          size: 38,
                          color: secondaryBase,
                        )
                      : SizedBox.shrink()),
            ),
            title: Text(
              paymentsTypesModel.title,
              style: TypographyStyle.bodyBlackLarge,
            ),
            trailing: SvgPicture.asset(
              isSelected
                  ? 'assets/svg/CheckboxActive.svg'
                  : 'assets/svg/Checkbox.svg',
              width: 22,
            ),
          ),
        ),
      ),
    );
  }
}
