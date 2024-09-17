import 'package:flutter/material.dart';

import '../../../../components/dialogs/loader_dialog.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoaderDialog(),
    );
  }
}
