import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/dialogs/register_basic_data/register_basic_data_screen.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../themes/input_decoration.dart';
import 'register_basic_data_controller.dart';

class RegisterBasicDataDialog extends StatelessWidget {
  const RegisterBasicDataDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: AlertDialog(
        content: Container(
          width: 400,
          child: RegisterBasicDataScreen(isDialog: true),
        ),
      ),
    );
  }
}
