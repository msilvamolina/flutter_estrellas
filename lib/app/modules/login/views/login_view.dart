import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/layouts/auth_layout.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool logoInitialScale = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'logo',
            child: SvgPicture.asset(
              'assets/svg/logo.svg',
              width: 100,
            ),
          ),
          Text('holis'),
          Text('holis'),
          Text('holis'),
          Text('holis'),
          Text('holis'),
        ],
      ),
    );
  }
}
