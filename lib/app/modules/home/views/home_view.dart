import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/modules/home/controllers/home_controller.dart';
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
      body: Center(
        child: Container(
          margin: EdgeInsets.all(isMobile ? 0 : 16),
          width: double.infinity,
          height: double.infinity,
          child: GetX<HomeController>(
            builder: (controller) {
              if (controller.list.isNotEmpty) {
                return PageView.builder(
                  itemCount: controller.list.length,
                  controller: PageController(
                      initialPage: pageSelected, viewportFraction: 1),
                  scrollDirection: Axis.vertical,
                  onPageChanged: (value) {
                    setState(() {
                      pageSelected = value;
                    });
                  },
                  itemBuilder: (context, index) => VideoCard(
                      videoPostModel: controller.list[index],
                      onCompleted: () {
                        pageController.animateToPage(pageSelected++,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.linear);
                        // pageController.
                      }),
                );
              } else {
                return const Text('no data');
              }
            },
          ),
        ),
      ),
    );
  }
}
