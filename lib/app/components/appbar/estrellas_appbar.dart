import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';

class EstrellasAppbar extends StatelessWidget implements PreferredSizeWidget {
  const EstrellasAppbar({required this.title, super.key});

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      surfaceTintColor: white,
      title: Text(
        title,
        style: TypographyStyle.bodyBlackLarge2,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
