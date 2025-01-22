import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../data/helpers/currency_helper.dart';
import '../../../../data/models/product_firebase_lite/product_firebase_lite.dart';
import '../../../../data/models/product_variant_combination/product_variant_combination_model.dart';
import '../../../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../../../libraries/icons/icons_font.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../../cart/widget/variation_widget.dart';
import '../controllers/order_details_controller.dart';

class OrderDetailsCard extends StatefulWidget {
  const OrderDetailsCard({required this.userProductCartModel, super.key});
  final UserProductCartModel userProductCartModel;

  @override
  State<OrderDetailsCard> createState() => _CartUniqueCardState();
}

class _CartUniqueCardState extends State<OrderDetailsCard> {
  @override
  Widget build(BuildContext context) {
    ProductFirebaseLiteModel product =
        widget.userProductCartModel.video!.product!;
    double price = widget.userProductCartModel.price;
    double suggestedPrice = widget.userProductCartModel.suggestedPrice;
    double profit = suggestedPrice - price;
    int points = widget.userProductCartModel.points;
    String profitStr =
        CurrencyHelpers.moneyFormat(amount: profit, withDecimals: false);
    String priceStr =
        CurrencyHelpers.moneyFormat(amount: price, withDecimals: false);
    // ProductVariantCombinationModel? variantCombination =
    //     widget.userProductCartModel.productCombination;

    return GetBuilder<OrderDetailsController>(
      id: 'card_product',
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: Image.network(
                      product.thumbnail ?? '',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.name ?? '',
                                style: TypographyStyle.bodyRegularLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              priceStr,
                              style: TypographyStyle.bodyBlackLarge
                                  .copyWith(fontSize: 20),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 6),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //         child: variantCombination != null
                        //             ? VariationWidget(
                        //                 variantCombination: variantCombination)
                        //             : const SizedBox.shrink(),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 6, right: 12, top: 2, bottom: 3),
                    decoration: const BoxDecoration(
                      color: primaryLight,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(EstrellasIcons.medal),
                        Text(
                          '$points puntos',
                          style: TypographyStyle.bodyBlackMedium,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
