import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/bottombar_layout.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottombarLayout(
        viewSelected: 4,
        child: Center(
          child: Text('Account'),
        ),
      ),
    );
  }
}
