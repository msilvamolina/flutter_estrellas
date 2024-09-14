import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_estrellas/app/modules/home/views/views/catalog_view.dart';
import 'package:flutter_estrellas/app/modules/home/views/views/more_view.dart';
import 'package:flutter_estrellas/app/modules/home/views/views/search_view.dart';
import 'package:flutter_estrellas/app/modules/home/views/views/wallet_view.dart';
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
    PageController pageController = PageController();

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
          floatingActionButton: _selectedIndex == 3
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.add),
                    ),
                    if (isMobile)
                      SizedBox(
                        height: 84,
                      )
                  ],
                )
              : null,
          appBar: !isTablet
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
                          icon: Icon(!_navigationExtended
                              ? Icons.menu
                              : Icons.menu_open),
                        )
                      : null,
                )
              : null,
          body: Row(
            children: [
              if (!isMobile)
                Stack(
                  children: [
                    NavigationRail(
                      labelType: !_navigationExtended || isTablet
                          ? NavigationRailLabelType.all
                          : null,
                      indicatorColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      selectedIconTheme: ThemeService.isDark()
                          ? IconThemeData(
                              color:
                                  Theme.of(context).colorScheme.primaryFixedDim)
                          : IconThemeData(
                              color: Theme.of(context).primaryColor),
                      unselectedIconTheme: IconThemeData(
                        color: neutral500,
                      ),
                      useIndicator: true,
                      extended: isTablet ? false : _navigationExtended,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                          pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.ease,
                          );
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
                                // Container(
                                //   width: 160,
                                //   child: Text(
                                //     'Log in to follow creators, like videos, and view comments.',
                                //     style: TypographyStyle.bodyRegularSmall,
                                //   ),
                                // ),
                                // SizedBox(height: 16),
                                // ElevatedButton(
                                //   onPressed: () {},
                                //   child: Text('Ingresar'),
                                // ),
                                // SizedBox(height: 16),
                                // Container(
                                //   decoration: BoxDecoration(
                                //       color: Theme.of(context)
                                //           .colorScheme
                                //           .tertiaryContainer,
                                //       borderRadius: BorderRadius.circular(16)),
                                //   padding: EdgeInsets.all(16),
                                //   child: Row(
                                //     children: [
                                //       Icon(
                                //         Icons.emoji_objects,
                                //         size: 22,
                                //       ),
                                //       SizedBox(width: 8),
                                //       Text(
                                //         'Creá un efecto Estrellas',
                                //         style: TypographyStyle.bodyRegularSmall
                                //             .copyWith(
                                //           color: Theme.of(context)
                                //               .colorScheme
                                //               .tertiary,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
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
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryFixedDim,
                                    ), // Aquí defines el color y grosor del borde
                                  ),
                                ),
                                icon: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Icon(
                                    controller.getThemeIcon(),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryFixedDim,
                                  ),
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
                child: Stack(
                  children: [
                    PageView(
                      controller: pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        InitialView(),
                        WalletView(),
                        SearchView(),
                        CatalogView(),
                        MoreView(),
                      ],
                    ),
                    if (isMobile)
                      Column(
                        children: [
                          Spacer(),
                          Container(
                            margin: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: ThemeService.isDark()
                                  ? Colors.black.withOpacity(0.5)
                                  : Colors.white.withOpacity(0.75),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: NavigationBarTheme(
                              data: NavigationBarThemeData(
                                // iconTheme: WidgetStateProperty.all(

                                // ),
                                iconTheme: MaterialStateProperty.resolveWith<
                                    IconThemeData?>(
                                  (Set<MaterialState> states) {
                                    // Si el botón está seleccionado, aplica un estilo diferente
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return ThemeService.isDark()
                                          ? IconThemeData(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primaryFixedDim)
                                          : IconThemeData(
                                              color: Theme.of(context)
                                                  .primaryColor);
                                    }
                                    return IconThemeData(
                                      color: ThemeService.isDark()
                                          ? neutral500
                                          : neutral700,
                                    );
                                  },
                                ),
                                indicatorColor: Theme.of(context)
                                    .primaryColor, // Color del indicador
                                labelTextStyle: MaterialStateProperty.all(
                                  TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight
                                          .w600), // Color del texto de la etiqueta
                                ),
                              ),
                              child: NavigationBar(
                                height: 64,
                                indicatorColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                backgroundColor: Colors.transparent,
                                labelBehavior: !isTinyPhone
                                    ? NavigationDestinationLabelBehavior
                                        .alwaysShow
                                    : NavigationDestinationLabelBehavior
                                        .alwaysHide,
                                selectedIndex: _selectedIndex,
                                onDestinationSelected: (int index) {
                                  setState(() {
                                    _selectedIndex = index;
                                    pageController.animateToPage(
                                      index,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  });
                                },
                                destinations: const [
                                  NavigationDestination(
                                    icon: Icon(Icons.home),
                                    label: 'Home',
                                  ),
                                  NavigationDestination(
                                      icon: Icon(Icons.wallet),
                                      label: 'Billetera'),
                                  NavigationDestination(
                                      icon: Icon(Icons.search),
                                      label: 'Buscar'),
                                  NavigationDestination(
                                      icon: Icon(Icons.dataset_rounded),
                                      label: 'Catálogo'),
                                  NavigationDestination(
                                      icon: Icon(Icons.apps_rounded),
                                      label: 'Más'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
