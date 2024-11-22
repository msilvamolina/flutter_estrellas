import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';

class EstrellasAppbar extends StatelessWidget implements PreferredSizeWidget {
  const EstrellasAppbar({
    required this.title,
    this.withBackButton = true,
    this.actions,
    super.key,
  });

  final String title;
  final bool withBackButton;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      surfaceTintColor: white,
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
