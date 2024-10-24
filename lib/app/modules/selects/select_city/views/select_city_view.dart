import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../themes/styles/typography.dart';
import '../controllers/select_city_controller.dart';

class SelectCityView extends GetView<SelectCityController> {
  const SelectCityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.department.name),
        centerTitle: true,
      ),
      body: GetBuilder<SelectCityController>(
        id: 'view',
        builder: (_) {
          if (!controller.isLoading) {
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: index == 0 ? 8 : 0,
                      bottom: index == (controller.data.length - 1) ? 48 : 0),
                  child: ListTile(
                    onTap: () => controller.onTap(controller.data[index]),
                    title: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        controller.data[index].name,
                        style: TypographyStyle.bodyBlackLarge,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
