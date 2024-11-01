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
      body: SingleChildScrollView(
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
            Text('Ver perfil'),
            Text('Ver perfil'),
          ],
        ),
      ),
    );
  }
}
