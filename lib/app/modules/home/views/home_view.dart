import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';

import 'components/video_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 60,
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
                    buttonCard('Home', EstrellasIcons.house),
                    buttonCard('Billetera', EstrellasIcons.wallet),
                    buttonCard('Buscar', EstrellasIcons.search),
                    buttonCard('Tienda', EstrellasIcons.storefront),
                    buttonCard('Cuenta', EstrellasIcons.userCircle),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonCard(String label, IconData icon) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryBase,
            borderRadius: BorderRadius.circular(16),
          ),
          height: 4,
          width: 33,
        ),
        SizedBox(height: 8),
        Icon(
          icon,
          color: neutral400,
        ),
        Text(
          label,
          style: TypographyStyle.bodyBlackSmall.copyWith(
            color: neutral400,
          ),
        ),
      ],
    );
  }
}
