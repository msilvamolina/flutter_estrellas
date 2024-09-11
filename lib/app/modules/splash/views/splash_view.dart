import 'package:flutter/material.dart';
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
    return AuthLayout(
      showBackground: false,
      child: Center(
        child: AnimatedScale(
          curve: Curves.bounceOut,
          scale: logoInitialScale ? 0 : 1,
          duration: Duration(seconds: 2),
          child: Hero(
            tag: 'logo',
            child: SvgPicture.asset(
              'assets/svg/logo.svg',
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}
