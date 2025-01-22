import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/product_variant_combination/product_variant_combination_model.dart';
import 'package:flutter_estrellas/app/data/models/user_product/user_product_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../components/fields/quantity.dart';
import '../../../data/helpers/currency_helper.dart';
import '../../../data/models/product_firebase_lite/product_firebase_lite.dart';
import '../../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../../libraries/icons/icons_font.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../../../utils/utils.dart';
import '../controllers/cart_controller.dart';
import 'variation_widget.dart';

class CartCard extends StatefulWidget {
  const CartCard({required this.userProductCartModel, super.key});
  final UserProductCartModel userProductCartModel;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  bool _isDeleted = false;
  int _countdown = 5;
  Timer? _timer;

  void _startCountdown(CartController controller) {
    if (!mounted) return;

    setState(() {
      _isDeleted = true;
      _countdown = 5;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        _timer?.cancel();
        return;
      }

      setState(() {
        _countdown--;
      });

      if (_countdown == 0) {
        _timer?.cancel();
        if (mounted) {
          setState(() {
            _isDeleted = false;
          });
        }
        controller.removeProduct(widget.userProductCartModel);
      }
    });
  }

  void _undoDelete() {
    if (!mounted) return;

    setState(() {
      _isDeleted = false;
    });
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela el timer al salir del widget
    super.dispose();
  }

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
    dynamic variantInfo = widget.userProductCartModel.variantInfo;

    return GetBuilder<CartController>(
      id: 'card_product',
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: _isDeleted
              ? GestureDetector(
                  onTap: _undoDelete,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Icon(EstrellasIcons.check,
                            color: success500, size: 36),
                        Text(
                          'Eliminado',
                          style: TypographyStyle.bodyBlackLarge
                              .copyWith(color: neutral950, fontSize: 18),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Toca para deshacer ($_countdown)',
                          style: TypographyStyle.bodyRegularLarge
                              .copyWith(color: neutral700),
                        ),
                      ],
                    ),
                  ),
                )
              : Slidable(
                  key: ValueKey(widget.userProductCartModel.id),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(
                      onDismissed: () {
                        _startCountdown(controller);
                      },
                    ),
                    children: [
                      CustomSlidableAction(
                        onPressed: (context) => _startCountdown(controller),
                        borderRadius: BorderRadius.circular(16),
                        backgroundColor: error50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              EstrellasIcons.trash,
                              color: error500,
                              size: 30,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Eliminar',
                              style: TypographyStyle.bodyRegularLarge
                                  .copyWith(color: neutral950),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)),
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
                                          style:
                                              TypographyStyle.bodyRegularLarge,
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
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (variantInfo != null)
                                          Expanded(
                                            child: Column(
                                              children: [
                                                for (dynamic value
                                                    in variantInfo['values'])
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
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
                            FieldQuantity(
                              value: controller
                                  .getQuantity(widget.userProductCartModel),
                              addFunction: () => controller
                                  .addFunction(widget.userProductCartModel),
                              minusFunction: () => controller
                                  .minusFunction(widget.userProductCartModel),
                              maxValue: widget.userProductCartModel.stock,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
