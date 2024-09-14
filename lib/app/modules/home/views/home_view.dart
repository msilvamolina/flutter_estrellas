import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';

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
          appBar: AppBar(
            title: const Text('HomeView'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                setState(() {
                  _navigationExtended = !_navigationExtended;
                });
              },
              icon: const Icon(Icons.menu),
            ),
          ),
          body: Row(
            children: [
              Stack(
                children: [
                  NavigationRail(
                    useIndicator: true,
                    extended: _navigationExtended,
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
                        child: IconButton.outlined(
                          onPressed: controller.changeThemeMode,
                          icon: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(controller.getThemeIcon()),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 540),
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SelectableText(
                          'Whereas disregard and contempt for human rights have resulted',
                          style: TypographyStyle.h1Mobile,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
