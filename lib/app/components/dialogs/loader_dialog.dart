import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../themes/styles/colors.dart';

class LoaderDialog extends StatelessWidget {
  const LoaderDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AbsorbPointer(
        absorbing: true,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Center(
            child: Hero(
              tag: 'logo',
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Shimmer.fromColors(
                      baseColor: primaryBase,
                      highlightColor: Color.fromARGB(255, 197, 252, 176),
                      child: SvgPicture.asset(
                        'assets/svg/logo.svg',
                        width: 100,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Espere un momento por favor',
                      textAlign: TextAlign.center,
                      style: TypographyStyle.bodyRegularLarge
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
