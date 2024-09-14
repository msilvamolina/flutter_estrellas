import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';

import 'views/initial_view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  bool _navigationExtended = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTinyPhone = screenWidth < 320;
    bool isMobile = screenWidth < 480;
    bool isTablet = screenWidth < 720;
    bool isDesktop = screenWidth > 720;

    List<NavigationRailDestination> navigationDestinations = [
      NavigationRailDestination(
        icon: const Icon(Icons.home),
        label: Text(
          'Home',
          style: TypographyStyle.bodyBlackMedium,
        ),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.wallet),
        label: Text(
          'Billetera',
          style: TypographyStyle.bodyBlackMedium,
        ),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.search),
        label: Text(
          'Buscar',
          style: TypographyStyle.bodyBlackMedium,
        ),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.dataset_rounded),
        label: Text(
          'Catálogo',
          style: TypographyStyle.bodyBlackMedium,
        ),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.apps_rounded),
        label: Text(
          'Más',
          style: TypographyStyle.bodyBlackMedium,
        ),
      ),
      // Add more destinations as needed
    ];
    return GetBuilder<HomeController>(
      id: 'view',
      builder: (controller) {
        return Scaffold(
          appBar: !isMobile
              ? AppBar(
                  title: const Text('HomeView'),
                  centerTitle: true,
                  leading: isDesktop
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _navigationExtended = !_navigationExtended;
                            });
                          },
                          icon: const Icon(Icons.menu),
                        )
                      : null,
                )
              : null,
          bottomNavigationBar: isMobile
              ? NavigationBar(
                  labelBehavior: !isTinyPhone
                      ? NavigationDestinationLabelBehavior.alwaysShow
                      : NavigationDestinationLabelBehavior.alwaysHide,
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    NavigationDestination(
                        icon: Icon(Icons.wallet), label: 'Billetera'),
                    NavigationDestination(
                        icon: Icon(Icons.search), label: 'Buscar'),
                    NavigationDestination(
                        icon: Icon(Icons.dataset_rounded), label: 'Catálogo'),
                    NavigationDestination(
                        icon: Icon(Icons.apps_rounded), label: 'Más'),
                  ],
                )
              : null,
          body: Row(
            children: [
              if (!isMobile)
                Stack(
                  children: [
                    NavigationRail(
                      useIndicator: true,
                      extended: isTablet ? false : _navigationExtended,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      destinations: navigationDestinations,
                    ),
                    GetBuilder<HomeController>(
                      id: 'themeButton',
                      builder: (_) {
                        return Positioned(
                          bottom: 16,
                          left: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (isTablet ? false : _navigationExtended) ...[
                                Container(
                                  width: 160,
                                  child: Text(
                                    'Log in to follow creators, like videos, and view comments.',
                                    style: TypographyStyle.bodyRegularSmall,
                                  ),
                                ),
                                SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Ingresar'),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiaryContainer,
                                      borderRadius: BorderRadius.circular(16)),
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.emoji_objects,
                                        size: 22,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Creá un efecto Estrellas',
                                        style: TypographyStyle.bodyRegularSmall
                                            .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Company'),
                                ),
                                SizedBox(height: 16),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Program'),
                                ),
                                SizedBox(height: 16),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Terms & Policies'),
                                ),
                                SizedBox(height: 16),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    '© 2024 Estrellas',
                                    style: TypographyStyle.bodyBlackSmall,
                                  ),
                                ),
                                SizedBox(height: 26),
                              ],
                              IconButton.outlined(
                                onPressed: controller.changeThemeMode,
                                icon: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Icon(controller.getThemeIcon()),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              Expanded(
                child: InitialView(),
              ),
            ],
          ),
        );
      },
    );
  }
}
