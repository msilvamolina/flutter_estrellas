import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';

import 'package:get/get.dart';

import '../controllers/bank_accounts_controller.dart';
import '../widgets/bank_account_empty_state.dart';

class BankAccountsView extends GetView<BankAccountsController> {
  const BankAccountsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(title: 'Cuentas bancarias'),
      body: BankAccountEmptyState(),
    );
  }
}
