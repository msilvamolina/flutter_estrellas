import 'package:flutter/material.dart';

import '../../../../themes/styles/typography.dart';

class VideoLabel extends StatelessWidget {
  const VideoLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/avatar.png',
            width: 40,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Bolso femenino cuero y tiras metálicas das dad asd asd ads ad  dad ad d a dad',
                  style: TypographyStyle.bodyRegularMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      'Shopi',
                      style: TypographyStyle.bodyBlackSmall,
                    ),
                    Text(
                      ' • ',
                      style: TypographyStyle.bodyBlackSmall,
                    ),
                    Text(
                      '619 puntos',
                      style: TypographyStyle.bodyRegularSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
