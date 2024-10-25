import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/styles/typography.dart';

class TitleWithCloseButton extends StatelessWidget {
  const TitleWithCloseButton({required this.title, super.key});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Text(
            title,
            style: TypographyStyle.h4Mobile.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
            size: 26,
          ),
        ),
      ],
    );
  }
}
