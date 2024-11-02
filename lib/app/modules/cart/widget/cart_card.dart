import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/user_product/user_product_model.dart';

import '../../../data/models/product_firebase_lite/product_firebase_lite.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';

class CartCard extends StatelessWidget {
  const CartCard({required this.userProductModel, super.key});
  final UserProductModel userProductModel;
  @override
  Widget build(BuildContext context) {
    return Container();
    // ProductFirebaseLiteModel product = userProductModel.product!;
    // return Padding(
    //   padding: const EdgeInsets.all(16),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       ClipOval(
    //         child: Image.network(
    //           product.thumbnail ?? '',
    //           width: 40,
    //           height: 40,
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       SizedBox(width: 8),
    //       Expanded(
    //         child: Row(
    //           children: [
    //             Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     product.name ?? '',
    //                     style: TypographyStyle.bodyRegularMedium,
    //                     maxLines: 1,
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                   SizedBox(height: 4),
    //                 ],
    //               ),
    //             ),
    //             Text(
    //               product.suggestedPrice.toString(),
    //               style: TypographyStyle.bodyBlackLarge,
    //               maxLines: 1,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
