import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/services/environment.dart';

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
      backgroundColor: neutral50,
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
                accountUser(
                  onTap: () {},
                  icon: EstrellasIcons.user,
                  title: 'Andrea Sánchez',
                ),
                SizedBox(height: 26),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.star,
                  title: 'Favoritos',
                ),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.stack,
                  title: 'Órdenes',
                ),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.creditCard,
                  title: 'Mis cuentas bancarias',
                ),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.graduationCap,
                  title: 'Academia',
                  isExternal: true,
                ),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.lifebuoy,
                  title: 'Ayuda',
                  isExternal: true,
                ),
                accountTile(
                  onTap: () {},
                  icon: EstrellasIcons.question,
                  title: 'Acerca de estrellas',
                ),
                accountTile(
                  onTap: controller.signOut,
                  icon: EstrellasIcons.signOut,
                  title: 'Cerrar Sesión',
                  isDestructive: true,
                ),
                SizedBox(height: 26),
                if (Environment.instance.currentEnv != Env.prod) ...[
                  Text(
                    Environment.instance.fullVersion.toString(),
                    style: TypographyStyle.bodyRegularLarge.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    Environment.instance.currentEnv.toString(),
                    style: TypographyStyle.bodyRegularLarge.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ] else
                  Text(
                    Environment.instance.version.toString(),
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

  Widget accountUser({
    required Function()? onTap,
    required IconData icon,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          margin: EdgeInsets.only(left: 16),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(
                color: neutral950,
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Icon(
            icon,
            size: 26,
            color: neutral950,
          ),
        ),
        title: Text(
          title,
          style: TypographyStyle.bodyRegularLarge.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          'Ver perfil',
          style: TypographyStyle.bodyRegularLarge.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: secondaryBase,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget accountTile({
    required Function()? onTap,
    required IconData icon,
    required String title,
    bool isExternal = false,
    bool isDestructive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: isDestructive ? error50 : secondaryLight,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Icon(
            icon,
            size: 32,
            color: isDestructive ? error900 : secondaryBase,
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
          isExternal
              ? EstrellasIcons.arrowSquareOut
              : EstrellasIcons.arrowRight,
          size: 26,
        ),
      ),
    );
  }
}
