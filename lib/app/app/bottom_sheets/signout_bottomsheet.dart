import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/modules/main/account/controllers/account_controller.dart';
import 'package:flutter_estrellas/app/modules/main/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignOutBottomsheet extends StatelessWidget {
  const SignOutBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      id: 'signout_bottom_sheet',
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: Text('cerrar sesion'),
        );
      },
    );
  }
}
