import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';

class EstrellasAppbar extends StatelessWidget implements PreferredSizeWidget {
  const EstrellasAppbar({
    required this.title,
    this.withBackButton = true,
    super.key,
  });

  final String title;
  final bool withBackButton;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      surfaceTintColor: white,
      automaticallyImplyLeading: withBackButton,
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
