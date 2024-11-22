import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/bank_account/bank_account_model.dart';

import '../../../../../themes/styles/colors.dart';
import '../../../../../themes/styles/typography.dart';

class BankAccountCard extends StatelessWidget {
  const BankAccountCard({required this.bankAccountModel, super.key});

  final BankAccountModel bankAccountModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          width: 1.5,
          color: neutral900,
        ),
        boxShadow: [
          BoxShadow(
            color: secondaryLight,
            blurRadius: 0,
            offset: Offset(-4, 4),
          ),
        ],
      ),
      child: Card(
        color: white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bankAccountModel.bank,
                style: TypographyStyle.bodyBlackLarge,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bankAccountModel.fullname,
                    style: TypographyStyle.bodyRegularMedium,
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '****',
                      style: TypographyStyle.bodyBlackLarge2,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    bankAccountModel.accountNumber.length >= 4
                        ? bankAccountModel.accountNumber.substring(
                            bankAccountModel.accountNumber.length - 4)
                        : bankAccountModel.accountNumber,
                    style: TypographyStyle.bodyRegularMedium,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
