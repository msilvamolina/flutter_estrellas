import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      id: 'main',
      builder: (_) {
        return child;
      },
    );
  }
}
