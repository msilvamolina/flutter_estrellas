import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/bottombar_layout.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchViewController> {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottombarLayout(
        viewSelected: 2,
        child: Center(
          child: Text('Search'),
        ),
      ),
    );
  }
}
