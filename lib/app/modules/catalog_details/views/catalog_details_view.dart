import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';

import 'package:get/get.dart';

import '../controllers/catalog_details_controller.dart';

class CatalogDetailsView extends GetView<CatalogDetailsController> {
  const CatalogDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(title: controller.catalogModel.name),
      body: const Center(
        child: Text(
          'CatalogDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
