import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../themes/styles/colors.dart';

class LoaderDialog extends StatelessWidget {
  const LoaderDialog({super.key, this.title, this.message});

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
                    if (title != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          title!,
                          textAlign: TextAlign.center,
                          style: TypographyStyle.bodyBlackLarge
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    if (title != null && message != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          message!,
                          textAlign: TextAlign.center,
                          style: TypographyStyle.bodyRegularSmall
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
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
