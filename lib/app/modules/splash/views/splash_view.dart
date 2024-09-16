import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/dialogs/loader_dialog.dart';
import 'package:flutter_estrellas/app/components/layouts/auth_layout.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool logoInitialScale = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        logoInitialScale = false;
      });
    });
    Future.delayed(Duration(seconds: 4), () {
      Get.toNamed(Routes.LOGIN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoaderDialog();
  }
}
