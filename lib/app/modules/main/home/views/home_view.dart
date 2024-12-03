import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../libraries/icons/icons_font.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../widgets/bottombar.dart';
import '../controllers/home_controller.dart';
import '../widgets/cart_badget.dart';
import '../widgets/video_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController pageController;
  int pageSelected = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose(); // Asegúrate de liberar el controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Bottombar(
        viewSelected: 0,
        isDarkTheme: true,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 19),
            child: CartBadget(),
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
                  if (mounted) {
                    setState(() {
                      pageSelected = value;
                    });
                  }
                  controller.mainController.removeSwipeUp();
                },
                itemBuilder: (context, index) => VideoCard(
                  videoPostModel: controller.list[index],
                  onCompleted: () {
                    if (pageController.hasClients) {
                      pageController.animateToPage(
                        pageSelected + 1, // Asegúrate de sumar 1 correctamente
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                    }
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
