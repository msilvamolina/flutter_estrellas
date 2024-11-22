import 'package:flutter/material.dart';

import '../../../../libraries/icons/icons_font.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';

class FaqExpandedCard extends StatelessWidget {
  const FaqExpandedCard({super.key});

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
            color:
                secondaryLight, // Ajusta el color y opacidad según tu necesidad
            blurRadius: 0, // Tamaño de desenfoque
            offset: Offset(-4, 4), // Posición de la sombra
          ),
        ],
      ),
      child: Card(
        color: white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
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
                        onTap: () {},
                        child: Icon(
                          EstrellasIcons.plusCircle,
                          size: 30,
                          color: secondaryBase,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Divider(
                color: neutral900,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Text(
                  'Phasellus accumsan imperdiet tempor. Cras tincidunt, arcu nec eleifend porttitor, orci est vehicula ',
                  style: TypographyStyle.bodyRegularMedium,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
