import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';

class EstrellasAppbar extends StatelessWidget implements PreferredSizeWidget {
  const EstrellasAppbar({
    required this.title,
    this.withBackButton = true,
    this.backgroundColor = Colors.white,
    this.actions,
    super.key,
  });

  final String title;
  final bool withBackButton;
  final List<Widget>? actions;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      automaticallyImplyLeading: withBackButton,
      title: Text(
        title,
        style: TypographyStyle.bodyBlackLarge,
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
