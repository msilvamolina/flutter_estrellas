import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import '../../../data/models/payments_types/payments_types_model.dart';
import '../../../themes/styles/colors.dart';

class PaymentTypeCard extends StatelessWidget {
  const PaymentTypeCard({required this.paymentsTypesModel, super.key});

  final PaymentsTypesModel paymentsTypesModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: neutral100,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          onTap: () {},
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
          trailing: Icon(Icons.check_box),
        ),
      ),
    );
  }
}
