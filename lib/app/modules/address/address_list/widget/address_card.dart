import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/address/address_model.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    required this.address,
    required this.isSelected,
    required this.isMain,
    super.key,
  });

  final AddressModel address;
  final bool isSelected;
  final bool isMain;
  @override
  Widget build(BuildContext context) {
    String subtitle =
        '${address.city?.name ?? ''}, ${address.department?.name ?? ''}, ${address.fullname ?? ''} - ${address.phone?.number ?? ''}';
    return Card(
      color: neutral100,
      elevation: 0,
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
                    address.address ?? '',
                    style:
                        TypographyStyle.bodyBlackLarge.copyWith(fontSize: 18),
                  ),
                ),
                SvgPicture.asset(
                  isSelected
                      ? 'assets/svg/radiobuttonActive.svg'
                      : 'assets/svg/radiobutton.svg',
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
                  subtitle,
                  style: TypographyStyle.bodyRegularLarge,
                ),
                SizedBox(height: 8),
                if (address.notes != null && address.notes != 'null')
                  Text(
                    address.notes!,
                    style: TypographyStyle.bodyRegularMedium
                        .copyWith(fontSize: 15, fontStyle: FontStyle.italic),
                  ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              if (isMain)
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
                onPressed: () {
                  Get.toNamed(Routes.NEW_ADDRESS, arguments: address);
                },
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
    );
  }
}
