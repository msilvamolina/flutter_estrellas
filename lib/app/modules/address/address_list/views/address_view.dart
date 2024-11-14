import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/modules/address/address_list/widget/address_card.dart';

import 'package:get/get.dart';

import '../../../../components/appbar/estrellas_appbar.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/address_controller.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: EstrellasAppbar(
        title: 'Mis domicilios',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.NEW_ADDRESS),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Lugar de envío',
                style: TypographyStyle.bodyBlackLarge2,
              ),
              SizedBox(height: 16),
              Obx(
                () => controller.list.isNotEmpty
                    ? ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.list.length,
                        itemBuilder: (context, index) {
                          return AddressCard(
                            isSelected: controller.selectedAddress.value ==
                                controller.list[index].id,
                            isMain: controller.mainAddress.value ==
                                controller.list[index].id,
                            address: controller.list[index],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                      )
                    : Center(child: const Text('no data')),
              ),
              Text('Lugar de envío'),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
