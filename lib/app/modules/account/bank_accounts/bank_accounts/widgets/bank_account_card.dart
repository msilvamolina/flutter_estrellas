import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/bank_account/bank_account_model.dart';

class BankAccountCard extends StatelessWidget {
  const BankAccountCard({required this.bankAccountModel, super.key});

  final BankAccountModel bankAccountModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Text(
          bankAccountModel.toString(),
        ),
      ),
    );
  }
}
