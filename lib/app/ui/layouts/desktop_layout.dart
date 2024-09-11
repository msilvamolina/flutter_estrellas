import 'package:flutter/material.dart';

import 'base_layout.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({
    super.key,
    this.view,
  });
  final Widget? view;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      view: view,
      flexLeftSidebar: 2,
      flexCenter: 7,
      flexAppbarCenter: 5,
      showRightSidebar: true,
      hideAppbarSpaces: true,
    );
  }
}
