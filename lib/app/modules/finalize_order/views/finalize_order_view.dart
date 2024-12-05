import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/components/dialogs/loader_dialog.dart';
import 'package:flutter_estrellas/app/modules/finalize_order/widgets/order_error_view.dart';
import 'package:flutter_estrellas/app/modules/finalize_order/widgets/order_pending_view.dart';

import 'package:get/get.dart';

import '../controllers/finalize_order_controller.dart';
import '../widgets/order_success_view.dart';

class FinalizeOrderView extends GetView<FinalizeOrderController> {
  const FinalizeOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Obx(() {
          if (controller.status.value == Status.loading) {
            return LoaderDialog();
          } else if (controller.status.value == Status.success) {
            return OrderSuccessView();
          } else if (controller.status.value == Status.pending) {
            return OrderPendingView();
          } else {
            return OrderErrorView();
          }
        }),
      ),
    );
  }
}
