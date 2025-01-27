import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/services/environment.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../data/models/videos/video_post_model.dart';
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
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;

    return Stack(
      children: [
        Scaffold(
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
            child: GetBuilder<HomeController>(
              id: 'list',
              builder: (controller) {
                return PagedPageView<int, DocumentSnapshot>(
                  scrollDirection: Axis.vertical,
                  pageController: controller.pageController,
                  pagingController: controller.pagingController,
                  onPageChanged: (value) {
                    if (mounted) {
                      setState(() {
                        pageSelected = value;
                      });
                    }
                    controller.mainController.removeSwipeUp();
                  },
                  builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, item, index) => VideoCard(
                      videoPostModel: VideoPostModel.fromDocument(item),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        GetX<UserProductController>(
          builder: (controller) {
            if (controller.reportVideoShowBlackView.value) {
              return Material(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 38,
                            ),
                            SizedBox(height: 16),
                            Text(
                              controller.reportVideoShowBlackViewBrand.value
                                  ? 'Marca bloqueada con éxito'
                                  : 'Gracias por reportar',
                              style: TypographyStyle.h3Mobile.copyWith(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16),
                            Text(
                              controller.reportVideoShowBlackViewBrand.value
                                  ? 'Los videos de esta marca no aparecerán nuevamente en tu feed'
                                  : 'Revisaremos tu reporte y tomaremos las medidas necesaria si existe alguna infracción de nuestras políticas.',
                              style: TypographyStyle.bodyRegularMedium.copyWith(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            TextButton(
                              onPressed: controller.reloadFeed,
                              child: Text(
                                'Recargar feed',
                                style: TypographyStyle.bodyBlackLarge.copyWith(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
