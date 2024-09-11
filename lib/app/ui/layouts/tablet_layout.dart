import 'package:flutter/material.dart';
import 'base_layout.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({
    super.key,
    this.view,
  });
  final Widget? view;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      view: view,
      flexLeftSidebar: 3,
      flexCenter: 9,
      flexAppbarCenter: 7,
      hideAppbarSpaces: true,
      showRightSidebar: false,
    );
  }
}
