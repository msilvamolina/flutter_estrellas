import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../components/buttons/buttons.dart';
import '../../data/models/payments_types/payments_types_model.dart';
import '../../libraries/icons/icons_font.dart';
import '../../modules/select_payment/widgets/payment_type_card.dart';
import 'widgets/title_with_close_button.dart';

class ReportVideoBottomsheet extends StatelessWidget {
  const ReportVideoBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    List<PaymentsTypesModel> _paymentsList = [];

    _paymentsList.add(
      PaymentsTypesModel(
        id: '0',
        title: 'Contenido y productos ilegales',
        image: 'assets/images/Gavel.png',
        paymentMethod: PaymentMethod.none,
      ),
    );
    _paymentsList.add(
      PaymentsTypesModel(
        id: '1',
        title: 'Contenido político, militar y discriminatorio',
        image: 'assets/images/Users.png',
        paymentMethod: PaymentMethod.none,
      ),
    );
    _paymentsList.add(
      PaymentsTypesModel(
        id: '2',
        title: 'Contenido sexual y para adultos',
        image: 'assets/images/Prohibit.png',
        paymentMethod: PaymentMethod.none,
      ),
    );
    _paymentsList.add(
      PaymentsTypesModel(
        id: '3',
        title: 'Propiedad intelectual y fraude',
        image: 'assets/images/Vector.png',
        paymentMethod: PaymentMethod.none,
      ),
    );
    _paymentsList.add(
      PaymentsTypesModel(
        id: '4',
        title: 'Privacidad y seguridad',
        image: 'assets/images/Lock.png',
        paymentMethod: PaymentMethod.none,
      ),
    );

    return GetBuilder<UserProductController>(
      id: 'report_video_bottomsheet',
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWithCloseButton(title: 'Reportar'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '¿Por qué motivo quieres reportar esta publicación?',
                style: TypographyStyle.bodyRegularLarge,
              ),
            ),
            for (PaymentsTypesModel element in _paymentsList)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: PaymentTypeCard(
                  onTap: () => controller.selectReportVideo(element),
                  isSelected: controller.isReportVideoSelected(element.id),
                  paymentsTypesModel: element,
                ),
              ),
            Obx(() => Padding(
                  padding: const EdgeInsets.all(16),
                  child: LoadingButton(
                    isLoading: controller.reportVideosButtonIsLoading.value,
                    style: ButtonStyles.primary,
                    onPressed: controller.reportVideosButtonEnabled.value
                        ? () => controller.reportVideoButtonPressed()
                        : null,
                    label: 'Continuar',
                  ),
                )),
            SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
