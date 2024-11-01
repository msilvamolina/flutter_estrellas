import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../libraries/icons/icons_font.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../widgets/bottombar.dart';
import '../controllers/home_controller.dart';
import '../widgets/video_card.dart';

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
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Bottombar(
        viewSelected: 0,
        isDarkTheme: true,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  EstrellasIcons.shoppingCartSimpleFill,
                  color: white,
                  size: 40,
                ),
              ),
              GetX<HomeController>(
                builder: (controller) {
                  return Positioned(
                    right: 6,
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
      body: Container(
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
    );
  }
}
