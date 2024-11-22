import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/bank_account/bank_account_model.dart';
import 'package:flutter_estrellas/app/data/models/product_variant_combination/product_variant_combination_model.dart';
import 'package:flutter_estrellas/app/data/models/user_product/user_product_model.dart';
import 'package:flutter_estrellas/app/modules/account/bank_accounts/bank_accounts/widgets/bank_account_card.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../libraries/icons/icons_font.dart';
import '../../../../../themes/styles/colors.dart';
import '../../../../../themes/styles/typography.dart';
import '../controllers/bank_accounts_controller.dart';

class BankAccountSlideCard extends StatefulWidget {
  const BankAccountSlideCard({required this.bankAccountModel, super.key});
  final BankAccountModel bankAccountModel;

  @override
  _BankAccountSlideCardState createState() => _BankAccountSlideCardState();
}

class _BankAccountSlideCardState extends State<BankAccountSlideCard> {
  bool _isDeleted = false;
  int _countdown = 5;
  Timer? _timer;

  void _startCountdown(BankAccountsController controller) {
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
        controller.removeAccount(widget.bankAccountModel);
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
    return GetBuilder<BankAccountsController>(
      id: 'account_view',
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
                  key: ValueKey(widget.bankAccountModel.id),
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
                  child: BankAccountCard(
                      bankAccountModel: widget.bankAccountModel),
                ),
        );
      },
    );
  }
}
