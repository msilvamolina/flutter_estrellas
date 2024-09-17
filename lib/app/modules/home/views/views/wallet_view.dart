import 'package:flutter/material.dart';

import '../../../../themes/styles/typography.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          constraints: const BoxConstraints(maxWidth: 540),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SelectableText(
                        'Whereas disregard and contempt for human rights have resulted',
                        style: TypographyStyle.h1Mobile,
                      ),
                    ],
                  ),
                ),
              ),
              Text('holiz'),
            ],
          ),
        ),
      ),
    );
  }
}
