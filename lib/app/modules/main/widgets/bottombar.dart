import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../libraries/icons/icons_font.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({required this.viewSelected, super.key});

  final int viewSelected;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 66,
        decoration: BoxDecoration(
          color: neutral900,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buttonCard(
              label: 'Home',
              icon: EstrellasIcons.house,
              iconActive: EstrellasIcons.houseFill,
              isActive: viewSelected == 0,
              onTap: () {
                if (viewSelected != 0) {
                  Get.back();
                }
              },
            ),
            buttonCard(
              label: 'Billetera',
              icon: EstrellasIcons.wallet,
              iconActive: EstrellasIcons.walletFill,
              isActive: viewSelected == 1,
              onTap: () {
                String route = Routes.WALLET;
                if (viewSelected == 0) {
                  Get.toNamed(route);
                } else {
                  Get.offNamed(route);
                }
              },
            ),
            buttonCard(
              label: 'Buscar',
              icon: EstrellasIcons.search,
              iconActive: EstrellasIcons.searchFill,
              isActive: viewSelected == 2,
              onTap: () {
                String route = Routes.SEARCH;
                if (viewSelected == 0) {
                  Get.toNamed(route);
                } else {
                  Get.offNamed(route);
                }
              },
            ),
            buttonCard(
              label: 'Tienda',
              icon: EstrellasIcons.storefront,
              iconActive: EstrellasIcons.storefrontFill,
              isActive: viewSelected == 3,
              onTap: () {
                String route = Routes.STORE;
                if (viewSelected == 0) {
                  Get.toNamed(route);
                } else {
                  Get.offNamed(route);
                }
              },
            ),
            buttonCard(
              label: 'Cuenta',
              icon: EstrellasIcons.userCircle,
              iconActive: EstrellasIcons.userCircle1,
              isActive: viewSelected == 4,
              onTap: () {
                String route = Routes.ACCOUNT;
                if (viewSelected == 0) {
                  Get.toNamed(route);
                } else {
                  Get.offNamed(route);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonCard({
    required String label,
    required IconData icon,
    required IconData iconActive,
    required bool isActive,
    required Function() onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: primaryBase.withOpacity(0.25),
        onTap: !isActive ? () => onTap() : null,
        child: SizedBox(
          width: 60,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isActive ? primaryBase : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 5,
                width: 42,
              ),
              SizedBox(height: 8),
              Icon(
                isActive ? iconActive : icon,
                color: isActive ? primaryBase : neutral400,
                size: 28,
              ),
              Text(
                label,
                style: TypographyStyle.bodyBlackSmall
                    .copyWith(color: neutral400, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
