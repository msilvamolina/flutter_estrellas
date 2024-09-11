import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/ui/layouts/mobile_layout.dart';
import 'package:velocity_x/velocity_x.dart';

import 'desktop_layout.dart';
import 'desktophd_layout.dart';
import 'tablet_layout.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    this.view,
  });
  final Widget? view;

  @override
  Widget build(BuildContext context) {
    return VxResponsive(
      xsmall: MobileLayout(view: view),
      small: TabletLayout(view: view),
      medium: DesktopLayout(view: view),
      large: DesktopHDLayout(view: view),
    );
  }
}
