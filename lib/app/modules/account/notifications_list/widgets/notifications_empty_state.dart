import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

class NotificationsEmptyState extends StatelessWidget {
  const NotificationsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/catalog.png',
            width: 70,
          ),
          SizedBox(height: 26),
          Text(
            'No tienes notificaciones',
            style: TypographyStyle.bodyBlackLarge2
                .copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Descubre todos los productos increíbles que tenemos para ti.',
            style: TypographyStyle.bodyRegularLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
