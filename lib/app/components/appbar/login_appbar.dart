import 'package:flutter/material.dart';

import '../../libraries/icons/icons_font.dart';
import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';

class LoginAppbar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      surfaceTintColor: white,
      title: const Text(''),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'Ayuda',
                  style: TypographyStyle.bodyRegularLarge,
                ),
                Icon(
                  EstrellasIcons.question,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
