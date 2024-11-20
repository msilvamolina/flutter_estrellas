import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../themes/styles/colors.dart';
import '../layouts/auth_layout.dart';
import '../layouts/loader_layout.dart';

class LoaderDialog extends StatelessWidget {
  const LoaderDialog({super.key, this.title, this.message});

  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Loader'),
    );
    // return LoaderLayout(
    //   child: AbsorbPointer(
    //     absorbing: true,
    //     child: Center(
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Lottie.asset(
    //             'assets/lotties/Loader.json',
    //           ),
    //           // Shimmer.fromColors(
    //           //   baseColor: primaryBase,
    //           //   highlightColor: primaryLight,
    //           //   child: SvgPicture.asset(
    //           //     'assets/svg/loader.svg',
    //           //     width: 100,
    //           //   ),
    //           // ),
    //           if (title != null)
    //             Padding(
    //               padding: const EdgeInsets.only(top: 8),
    //               child: Text(
    //                 title!,
    //                 textAlign: TextAlign.center,
    //                 style: TypographyStyle.bodyRegularLarge,
    //               ),
    //             ),
    //           if (title != null && message != null)
    //             Padding(
    //               padding: const EdgeInsets.only(top: 2),
    //               child: Text(
    //                 message!,
    //                 textAlign: TextAlign.center,
    //                 style: TypographyStyle.bodyRegularSmall
    //                     .copyWith(fontWeight: FontWeight.w500),
    //               ),
    //             ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
