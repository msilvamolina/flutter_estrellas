import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/product_variant_combination/product_variant_combination_model.dart';
import 'package:flutter_estrellas/app/data/models/user_product/user_product_model.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../components/fields/quantity.dart';
import '../../../data/helpers/currency_helper.dart';
import '../../../data/models/product_firebase_lite/product_firebase_lite.dart';
import '../../../data/models/user_product_cart/user_product_cart_model.dart';
import '../../../libraries/icons/icons_font.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
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
    setState(() {
      _isDeleted = true;
      _countdown = 5;
    });

    // Inicia la cuenta regresiva
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _countdown--;
      });

      if (_countdown == 0) {
        _timer?.cancel();
        setState(() {
          _isDeleted =
              false; // Oculta el mensaje después de la cuenta regresiva
        });
        controller.removeProduct(widget.userProductCartModel);
      }
    });
  }

  void _undoDelete() {
    // Cancela la eliminación
    setState(() {
      _isDeleted = false;
    });
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
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
    ProductVariantCombinationModel? variantCombination =
        widget.userProductCartModel.productCombination;

    return GetBuilder<CartController>(
      id: 'card_product',
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: _isDeleted
              ? GestureDetector(
                  onTap: _undoDelete,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 30),
                        Text(
                          'Eliminado',
                          style: TypographyStyle.bodyBlackLarge,
                        ),
                        Text(
                          'Toca para deshacer ($_countdown)',
                          style: TypographyStyle.bodyBlackLarge,
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
                        // Inicia la cuenta regresiva inmediatamente después de deslizar
                        _startCountdown(controller);
                      },
                    ),
                    children: [
                      SlidableAction(
                        onPressed: (context) => _startCountdown(controller),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Eliminar',
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            child: Image.network(
                              product.thumbnail ?? '',
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16),
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: variantCombination != null
                                            ? VariationWidget(
                                                variantCombination:
                                                    variantCombination)
                                            : SizedBox.shrink(),
                                      ),
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
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 6, right: 12, top: 2, bottom: 3),
                            decoration: BoxDecoration(
                              color: primaryLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(EstrellasIcons.medal),
                                Text(
                                  '$points puntos',
                                  style: TypographyStyle.bodyBlackMedium,
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
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
        );
      },
    );
  }
}
