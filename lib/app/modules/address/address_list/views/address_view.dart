import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/buttons/buttons.dart';
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => Button(
              onPressed: controller.selectedAddress.value != null
                  ? controller.goToSelectectPayment
                  : null,
              label: 'Continuar',
              style: ButtonStyles.primary,
            ),
          ),
        ),
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
                          return GestureDetector(
                            onTap: () => controller
                                .selectAddress(controller.list[index]),
                            child: Obx(() => AddressCard(
                                  isSelected:
                                      controller.selectedAddress.value ==
                                          controller.list[index],
                                  isMain: controller.mainAddress.value ==
                                      controller.list[index],
                                  address: controller.list[index],
                                )),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                      )
                    : Center(child: const SizedBox.shrink()),
              ),
              Center(
                child: Button(
                  onPressed: () => Get.toNamed(Routes.NEW_ADDRESS),
                  style: ButtonStyles.secondaryLink,
                  label: 'Agregar nuevo domicilio',
                ),
              ),
              SizedBox(height: 140),
            ],
          ),
        ),
      ),
    );
  }
}
