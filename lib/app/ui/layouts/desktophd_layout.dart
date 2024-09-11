import 'package:flutter/material.dart';

import 'base_layout.dart';

class DesktopHDLayout extends StatelessWidget {
  const DesktopHDLayout({
    super.key,
    this.view,
  });
  final Widget? view;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      view: view,
      flexLeftSidebar: 3,
      flexCenter: 7,
      flexAppbarCenter: 7,
      showRightSidebar: true,
    );
  }
}
