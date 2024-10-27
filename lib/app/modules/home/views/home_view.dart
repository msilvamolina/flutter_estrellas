import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'components/video_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int viewSelected = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;

    PageController pageController = PageController();
    int pageSelected = 0;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(isMobile ? 0 : 16),
              width: double.infinity,
              height: double.infinity,
              child: GetX<HomeController>(
                builder: (controller) {
                  if (controller.list.isNotEmpty) {
                    return PageView.builder(
                      itemCount: controller.list.length,
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      onPageChanged: (value) {
                        setState(() {
                          pageSelected = value;
                        });
                      },
                      itemBuilder: (context, index) => VideoCard(
                        videoPostModel: controller.list[index],
                        onCompleted: () {
                          pageController.animateToPage(
                            pageSelected++,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.linear,
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: Text('no data'));
                  }
                },
              ),
            ),
          ),
          SafeArea(
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.CART);
                    },
                    icon: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                    0.05), // Sombra con opacidad del 30%
                                offset: Offset(1, 1), // Desplazamiento en x e y
                                blurRadius: 6, // Radio de desenfoque
                              ),
                            ],
                          ),
                          child: Icon(
                            EstrellasIcons.shoppingCartSimpleFill,
                            color: white,
                            size: 40,
                          ),
                        ),
                        GetX<HomeController>(
                          builder: (controller) {
                            return Positioned(
                              right: 0,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: error900,
                                child: Text(
                                  controller.userProductController
                                      .listProductCart.length
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
                  ),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 26,
            left: 16,
            right: 16,
            child: Center(
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
                          setState(() {
                            viewSelected = 0;
                          });
                        }),
                    buttonCard(
                        label: 'Billetera',
                        icon: EstrellasIcons.wallet,
                        iconActive: EstrellasIcons.walletFill,
                        isActive: viewSelected == 1,
                        onTap: () {
                          setState(() {
                            viewSelected = 1;
                          });
                        }),
                    buttonCard(
                        label: 'Buscar',
                        icon: EstrellasIcons.search,
                        iconActive: EstrellasIcons.searchFill,
                        isActive: viewSelected == 2,
                        onTap: () {
                          setState(() {
                            viewSelected = 2;
                          });
                        }),
                    buttonCard(
                        label: 'Tienda',
                        icon: EstrellasIcons.storefront,
                        iconActive: EstrellasIcons.storefrontFill,
                        isActive: viewSelected == 3,
                        onTap: () {
                          setState(() {
                            viewSelected = 3;
                          });
                        }),
                    buttonCard(
                        label: 'Cuenta',
                        icon: EstrellasIcons.userCircle,
                        iconActive: EstrellasIcons.userCircle1,
                        isActive: viewSelected == 4,
                        onTap: () {
                          setState(() {
                            viewSelected = 4;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonCard({
    required String label,
    required IconData icon,
    required IconData iconActive,
    required bool isActive,
    Function()? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: primaryBase.withOpacity(0.25),
        onTap: onTap,
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
