import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favorites_controller.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesController>(
      id: 'view',
      init: FavoritesController(),
      builder: (_controller) {
        if (_controller.isLoading)
          return Center(child: CircularProgressIndicator());
        return Column(
          children: [
            Expanded(
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: Text(
                    'Four page',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: Text(
                    'Four page',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
