import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../themes/styles/colors.dart';
import '../custom_positioned.dart';

class ConfettiDialog extends StatelessWidget {
  const ConfettiDialog({super.key, this.title, this.message});

  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AbsorbPointer(
        absorbing: true,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Center(
            child: Lottie.asset(
              'assets/lotties/welcome.json',
              width: 300,
            ),
          ),
        ),
      ),
    );
  }
}
