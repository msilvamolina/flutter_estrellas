// import 'package:flutter/material.dart';
// import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
// import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
// import 'package:flutter_estrellas/app/modules/auth/email_verification/controllers/email_verification_controller.dart';
// import 'package:flutter_estrellas/app/modules/catalog_details/controllers/catalog_details_controller.dart';
// import 'package:flutter_estrellas/app/modules/main/account/controllers/account_controller.dart';
// import 'package:flutter_estrellas/app/modules/main/home/controllers/home_controller.dart';
// import 'package:flutter_estrellas/app/themes/styles/colors.dart';
// import 'package:flutter_estrellas/app/themes/styles/typography.dart';
// import 'package:get/get.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// import '../../components/buttons/buttons.dart';
// import 'widgets/title_with_close_button.dart';

// class DeleteProductsCatalogBottomsheet extends StatelessWidget {
//   const DeleteProductsCatalogBottomsheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CatalogDetailsController>(
//       id: 'bottomsheet',
//       builder: (controller) {
//         return Container(
//           width: double.infinity,
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(height: 16),
//                     Icon(
//                       EstrellasIcons.infoFill,
//                       color: info500,
//                       size: 44,
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       '¿Seguro que quieres eliminar\neste contenido del catálogo?',
//                       style: TypographyStyle.h3Mobile,
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Perderás el contenido guardado en\nel catálogo ${controller.catalogModel.name}',
//                       style: TypographyStyle.bodyRegularMedium,
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 28),
//                     Button(
//                       style: ButtonStyles.primary,
//                       onPressed: () {
//                         // Get.back();
//                         // controller.deleteProductsInCatalog();
//                       },
//                       label: 'Sí',
//                     ),
//                     SizedBox(height: 24),
//                     Button(
//                       style: ButtonStyles.secondary,
//                       onPressed: Get.back,
//                       label: 'No',
//                     ),
//                   ],
//                 ),
//               ),
//               TitleWithCloseButton(title: ''),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
