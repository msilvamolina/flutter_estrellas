import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, required this.child});
  final Widget child;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      id: 'main',
      builder: (_) {
        return widget.child;
      },
    );
  }
}
