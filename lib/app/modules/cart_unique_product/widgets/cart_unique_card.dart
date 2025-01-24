import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/product_variant_info/product_variant_info_model.dart';
import 'package:get/get.dart';

import '../../../components/fields/quantity.dart';
import '../../../data/helpers/currency_helper.dart';
import '../../../data/models/product_firebase_lite/product_firebase_lite.dart';
import '../../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../../libraries/icons/icons_font.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../../../utils/utils.dart';
import '../controllers/cart_unique_product_controller.dart';

class CartUniqueCard extends StatefulWidget {
  const CartUniqueCard({required this.userProductCartModel, super.key});
  final UserProductCartModel userProductCartModel;

  @override
  State<CartUniqueCard> createState() => _CartUniqueCardState();
}

class _CartUniqueCardState extends State<CartUniqueCard> {
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

    String? variantID = widget.userProductCartModel.variantID;
    ProductVariantInfoModel? variantInfo =
        widget.userProductCartModel.variantInfo;

    return GetBuilder<CartUniqueProductController>(
      id: 'card_product',
      builder: (controller) {
        return GestureDetector(
          onTap: variantInfo != null
              ? () =>
                  controller.pickVariantsProduct(widget.userProductCartModel)
              : null,
          child: Container(
            color: Colors.white,
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
                                  Utils.capitalize(product.name ?? ''),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (variantInfo != null)
                                  Expanded(
                                    child: Column(
                                      children: [
                                        for (dynamic value
                                            in variantInfo.values)
                                          Row(
                                            children: [
                                              Text(
                                                '${Utils.capitalize(value['attribute_name'])}: ',
                                                style: TypographyStyle
                                                    .bodyBlackMedium,
                                              ),
                                              Text(
                                                Utils.capitalize(
                                                    value['value']),
                                                style: TypographyStyle
                                                    .bodyRegularMedium,
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  )
                                else
                                  Spacer(),
                                Text(
                                  'Ganas $profitStr',
                                  style: TypographyStyle.bodyBlackMedium
                                      .copyWith(color: success900),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
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
                    Obx(
                      () => FieldQuantity(
                        value:
                            controller.userProductController.cartQuantity.value,
                        addFunction: controller
                            .userProductController.addUniqueProductQuantity,
                        minusFunction: controller
                            .userProductController.minusUniqueProductQuantity,
                        maxValue: widget.userProductCartModel.stock,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
