import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../../components/appbar/estrellas_appbar.dart';
import '../../../components/dialogs/loader_dialog.dart';
import '../controllers/payments_method_controller.dart';

class PaymentsMethodView extends StatefulWidget {
  const PaymentsMethodView({super.key});

  @override
  State<PaymentsMethodView> createState() => _PaymentsMethodViewState();
}

class _PaymentsMethodViewState extends State<PaymentsMethodView> {
  InAppWebViewController? _webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentsMethodController>(
      builder: (paymentsController) {
        return Scaffold(
          appBar: EstrellasAppbar(title: 'Confirmar pago'),
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(Uri.parse(paymentsController.url).toString()),
                  method: "POST",
                  body: Uint8List.fromList(
                    paymentsController.formData.entries
                        .map((e) =>
                            "${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}")
                        .join("&")
                        .codeUnits,
                  ),
                  headers: {
                    "Content-Type": "application/x-www-form-urlencoded",
                  },
                ),
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
                onLoadStart: (controller, url) {
                  setState(() {
                    isLoading = true;
                  });
                },
                onLoadStop: (controller, url) async {
                  setState(() {
                    isLoading = false;
                  });
                },
                onUpdateVisitedHistory: (controller, uri, androidIsReload) {
                  if (uri != null &&
                      uri.toString().startsWith(
                          paymentsController.formData["response_url"]!)) {
                    paymentsController.onCompleted();
                  }
                },
              ),
              if (isLoading) Center(child: LoaderDialog()),
            ],
          ),
        );
      },
    );
  }
}
