import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/layouts/loader_layout.dart';

import '../../../../components/dialogs/loader_dialog.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderDialog();
  }
}
