import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

class WalletEmptyState extends StatelessWidget {
  const WalletEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 78),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/catalog.png',
              width: 76,
            ),
            SizedBox(height: 16),
            Text(
              'Sin movimientos',
              style: TypographyStyle.h3Mobile,
            ),
            SizedBox(height: 16),
            Text(
              'Da el primer paso y comienza a\nvender tus productos.',
              textAlign: TextAlign.center,
              style: TypographyStyle.bodyRegularLarge,
            ),
          ],
        ),
      ),
    );
  }
}
