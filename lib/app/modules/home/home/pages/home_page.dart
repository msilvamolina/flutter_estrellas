import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../../ui/layouts/main_layout.dart';
import '../views/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_controller) {
        return MainLayout(
          view: kIsWeb ? HomeView() : null,
        );
      },
    );
  }
}
