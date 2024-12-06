import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/services/environment.dart';

import 'package:get/get.dart';

import '../../../../libraries/icons/icons_font.dart';
import '../../../../routes/app_pages.dart';
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
                onPressed: () => Get.toNamed(Routes.NOTIFICATIONS_LIST),
                icon: Icon(
                  EstrellasIcons.bell,
                  color: neutral700,
                  size: 40,
                ),
              ),
              GetX<HomeController>(
                builder: (controller) {
                  return controller
                          .userProductController.listProductCart.isNotEmpty
                      ? Positioned(
                          right: 10,
                          top: 8,
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor: error900,
                            child: Text(
                              controller
                                  .userProductController.listProductCart.length
                                  .toString(),
                              style: TypographyStyle.bodyBlackSmall
                                  .copyWith(color: white, fontSize: 12),
                            ),
                          ),
                        )
                      : SizedBox.shrink();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => accountUser(
                onTap: controller.goToProfile,
                icon: EstrellasIcons.user,
                title: controller.userTitle.value ?? '',
                image: controller.userImage.value,
              ),
            ),
            SizedBox(height: 26),
            accountTile(
              onTap: () => Get.toNamed(Routes.FAVORITES),
              icon: EstrellasIcons.star,
              title: 'Favoritos',
            ),
            accountTile(
              onTap: controller.goToOrders,
              icon: EstrellasIcons.stack,
              title: 'Órdenes',
            ),
            accountTile(
              onTap: () => Get.toNamed(Routes.BANK_ACCOUNTS),
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
              onTap: () => Get.toNamed(Routes.ABOUT),
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
              if (Environment.instance.fullVersion != null)
                Text(
                  Environment.instance.fullVersion.toString(),
                  style: TypographyStyle.bodyRegularLarge.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (Environment.instance.currentEnv != null)
                Text(
                  Environment.instance.currentEnv.toString(),
                  style: TypographyStyle.bodyRegularLarge.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ] else if (Environment.instance.version != null)
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
            SizedBox(height: 26),
          ],
        ),
      ),
    );
  }

  Widget accountUser({
    required Function()? onTap,
    required IconData icon,
    required String title,
    String? image,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          margin: EdgeInsets.only(
            left: 0,
          ),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              image: image != null
                  ? DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    )
                  : null,
              border: Border.all(
                color: neutral950,
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: image == null || image == 'null'
              ? Icon(
                  icon,
                  size: 26,
                  color: neutral950,
                )
              : SizedBox(
                  width: 24,
                  height: 24,
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
