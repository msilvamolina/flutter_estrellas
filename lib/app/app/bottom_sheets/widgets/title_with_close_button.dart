import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../themes/styles/typography.dart';

class TitleWithCloseButton extends StatelessWidget {
  const TitleWithCloseButton(
      {required this.title, this.actionClose, this.style, super.key});

  final String title;
  final TextStyle? style;
  final Function()? actionClose;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Text(
            title,
            style: style ??
                TypographyStyle.h4Mobile.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 22),
          child: GestureDetector(
            onTap: actionClose ??
                () {
                  Get.back();
                },
            child: SvgPicture.asset(
              'assets/svg/close.svg',
              width: 18,
            ),
          ),
        ),
      ],
    );
  }
}
