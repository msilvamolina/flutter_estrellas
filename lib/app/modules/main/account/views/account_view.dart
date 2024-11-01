import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../libraries/icons/icons_font.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../home/controllers/home_controller.dart';
import '../../widgets/bottombar.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  EstrellasIcons.bell,
                  color: neutral700,
                  size: 40,
                ),
              ),
              GetX<HomeController>(
                builder: (controller) {
                  return Positioned(
                    right: 10,
                    top: 8,
                    child: CircleAvatar(
                      radius: 9,
                      backgroundColor: error900,
                      child: Text(
                        controller.userProductController.listProductCart.length
                            .toString(),
                        style: TypographyStyle.bodyBlackSmall
                            .copyWith(color: white, fontSize: 12),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Bottombar(
        viewSelected: 4,
        isDarkTheme: false,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.abc),
                    Column(
                      children: [
                        Text('Andrea Sánchez'),
                        Text('Ver perfil'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 26),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.star,
                  title: 'Favoritos',
                ),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.star,
                  title: 'Órdenes',
                ),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.star,
                  title: 'Mis cuentas bancarias',
                ),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.star,
                  title: 'Academia',
                ),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.star,
                  title: 'Ayuda',
                ),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.star,
                  title: 'Acerca de estrellas',
                ),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.star,
                  title: 'Cerrar Sesión',
                ),
                SizedBox(height: 26),
                Text(
                  '2.0.6',
                  style: TypographyStyle.bodyRegularLarge.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '© Estrellas APP',
                  style: TypographyStyle.bodyRegularLarge.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget accountTile({
    required Function()? onTap,
    required IconData icon,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: secondaryLight,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Icon(
            icon,
            size: 28,
            color: secondaryBase,
          ),
        ),
        title: Text(
          title,
          style: TypographyStyle.bodyRegularLarge.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          EstrellasIcons.arrowRight,
          size: 26,
        ),
      ),
    );
  }
}
