// import 'package:flutter/material.dart';
// import 'package:flutter_estrellas/app/themes/styles/colors.dart';
// import 'package:flutter_estrellas/app/themes/styles/typography.dart';
// import 'package:get/get.dart';

// import '../../../../app/bottom_sheets/select_variant_size.dart';
// import '../../../../components/bottom_sheets/bottomsheets.dart';
// import '../../../../components/bottom_sheets/types.dart';
// import '../../../../data/models/product_variant/product_variant_model.dart';
// import '../../controllers/product_details_controller.dart';
// import '../content/product_card_container.dart';

// class ProductVariantsSize extends StatelessWidget {
//   const ProductVariantsSize({required this.listVariants, super.key});
//   final List<ProductVariantModel> listVariants;
//   @override
//   Widget build(BuildContext context) {
//     return listVariants.isNotEmpty
//         ? GetBuilder<ProductDetailsController>(
//             id: 'product_variant_size',
//             builder: (controller) {
//               controller.setFirstVariantSize(listVariants.first);

//               return GestureDetector(
//                 onTap: () {
//                   selectSizeBottomSheet();
//                 },
//                 child: ProductCardContainer(
//                   child: Row(
//                     children: [
//                       Text(
//                         'Talla',
//                         style: TypographyStyle.bodyRegularLarge
//                             .copyWith(color: neutral700),
//                       ),
//                       Spacer(),
//                       Text(
//                         controller.userProductVariantSize?.label ?? '',
//                         style: TypographyStyle.bodyRegularLarge.copyWith(
//                           color: neutral700,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             })
//         : SizedBox.shrink();
//   }

//   void selectSizeBottomSheet() {
//     showModalBottomSheet(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(16),
//           topRight: Radius.circular(16),
//         ),
//       ),
//       isScrollControlled: true,
//       context: Get.context!,
//       backgroundColor: Colors.transparent,
//       builder: (context) => Padding(
//         padding: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom,
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(16),
//             topRight: Radius.circular(16),
//           ),
//           child: Material(
//             child: SafeArea(
//               top: false,
//               child: SelectVariantSizeBottomSheet(listVariants: listVariants),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
