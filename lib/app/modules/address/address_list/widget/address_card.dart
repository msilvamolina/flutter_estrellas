import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/address/address_model.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({required this.address, super.key});

  final AddressModel address;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: neutral100,
      elevation: 0,
      child: InkWell(
        onTap: () => Get.toNamed(Routes.SELECT_PAYMENT, arguments: address),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Calle 84#41d-115',
                      style: TypographyStyle.bodyBlackLarge,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/svg/radiobuttonActive.svg',
                    width: 20,
                  )
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Barranquilla, Atlántico, Kevin Paternina - 3017393266',
                    style: TypographyStyle.bodyRegularLarge,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Conjunto residencial oporto, entregar en portería',
                    style: TypographyStyle.bodyRegularMedium
                        .copyWith(fontSize: 15, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                      color: success50,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Text(
                    'Principal',
                    style: TypographyStyle.bodyRegularMedium
                        .copyWith(color: success900),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    EstrellasIcons.pencilSimple,
                    color: secondaryBase,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
