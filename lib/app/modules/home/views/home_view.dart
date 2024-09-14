import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
        icon: Icon(Icons.home),
        label: Text(
          'For you',
          style: GoogleFonts.montserrat(
              textStyle: Theme.of(context).textTheme.titleMedium),
        ),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.settings),
        label: Text('Settings'),
      ),
      // Add more destinations as needed
    ];
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
          Container(
            color: Colors.red,
            child: NavigationRail(
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
          ),
          Expanded(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 540),
                height: double.infinity,
                width: double.infinity,
                child: SelectableText(
                  'Whereas disregard and contempt for human rights have resulted',
                  style: TypographyStyle.h1Mobile.copyWith(
                    fontWeight: FontWeight.normal,
                    color: secondaryLight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
