import 'package:flutter/material.dart';

import '../../../../libraries/icons/icons_font.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';

class FaqExpandedCard extends StatefulWidget {
  const FaqExpandedCard({super.key});

  @override
  State<FaqExpandedCard> createState() => _FaqExpandedCardState();
}

class _FaqExpandedCardState extends State<FaqExpandedCard>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          width: 1.5,
          color: neutral900,
        ),
        boxShadow: [
          BoxShadow(
            color: secondaryLight,
            blurRadius: 0,
            offset: Offset(-4, 4),
          ),
        ],
      ),
      child: Card(
        color: white,
        elevation: 0,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectet adipiscing elit',
                          style: TypographyStyle.bodyBlackLarge,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Icon(
                            isExpanded
                                ? EstrellasIcons.minusCircle
                                : EstrellasIcons.plusCircle,
                            size: 30,
                            color: secondaryBase,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isExpanded)
                  Column(
                    children: [
                      const SizedBox(height: 8),
                      Divider(
                        color: neutral900,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 8),
                        child: Text(
                          'Phasellus accumsan imperdiet tempor. Cras tincidunt, arcu nec eleifend porttitor, orci est vehicula',
                          style: TypographyStyle.bodyRegularMedium,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
