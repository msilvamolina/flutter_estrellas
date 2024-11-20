import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../libraries/icons/icons_font.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({
    required this.viewSelected,
    this.isDarkTheme = false,
    super.key,
  });

  final int viewSelected;
  final bool isDarkTheme;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 66,
        decoration: BoxDecoration(
          color: isDarkTheme ? neutral900 : neutral50,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isDarkTheme
                  ? Colors.black.withOpacity(0.3)
                  : Colors.black.withOpacity(0.05),
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
              isDarkTheme: isDarkTheme,
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
              isDarkTheme: isDarkTheme,
              label: 'Billetera',
              icon: EstrellasIcons.wallet,
              iconActive: EstrellasIcons.walletFill,
              isActive: viewSelected == 1,
              onTap: () {
                mainController.actionNeedLogin(() {
                  String route = Routes.WALLET;
                  if (viewSelected == 0) {
                    Get.toNamed(route);
                  } else {
                    Get.offNamed(route);
                  }
                });
              },
            ),
            buttonCard(
              isDarkTheme: isDarkTheme,
              label: 'Buscar',
              icon: EstrellasIcons.search,
              iconActive: EstrellasIcons.searchFill,
              isActive: viewSelected == 2,
              onTap: () {
                mainController.actionNeedLogin(() {
                  String route = Routes.SEARCH;
                  if (viewSelected == 0) {
                    Get.toNamed(route);
                  } else {
                    Get.offNamed(route);
                  }
                });
              },
            ),
            buttonCard(
              isDarkTheme: isDarkTheme,
              label: 'Catálogo',
              icon: EstrellasIcons.storefront,
              iconActive: EstrellasIcons.storefrontFill,
              isActive: viewSelected == 3,
              onTap: () {
                mainController.actionNeedLogin(() {
                  String route = Routes.STORE;
                  if (viewSelected == 0) {
                    Get.toNamed(route);
                  } else {
                    Get.offNamed(route);
                  }
                });
              },
            ),
            buttonCard(
              isDarkTheme: isDarkTheme,
              label: 'Cuenta',
              icon: EstrellasIcons.userCircle,
              iconActive: EstrellasIcons.userCircle1,
              isActive: viewSelected == 4,
              onTap: () {
                mainController.actionNeedLogin(() {
                  String route = Routes.ACCOUNT;
                  if (viewSelected == 0) {
                    Get.toNamed(route);
                  } else {
                    Get.offNamed(route);
                  }
                });
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
    required bool isDarkTheme,
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
                color: isActive
                    ? primaryBase
                    : (isDarkTheme ? neutral400 : neutral900),
                size: 28,
              ),
              Text(
                label,
                style: TypographyStyle.bodyBlackSmall.copyWith(
                    color: isDarkTheme ? neutral400 : neutral900,
                    fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
