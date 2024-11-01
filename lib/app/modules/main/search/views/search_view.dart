import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/bottombar.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchViewController> {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Bottombar(
        viewSelected: 2,
        isDarkTheme: false,
      ),
      body: Center(
        child: Text('wallet'),
      ),
    );
  }
}
