import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  InAppWebViewController? _webViewController;

  final String url = "https://merchant.paymentsway.co/cartaspago/redirect";

  final Map<String, String> formData = {
    "merchant_id": "2536",
    "form_id": "2585",
    "terminal_id": "1873",
    "order_number": "12542",
    "amount": "100000",
    "currency": "cop",
    "order_description": "Camiseta Messi Campeón",
    "color_base": "#DE073F",
    "client_email": "poncioharry@gmail.com",
    "client_phone": "3202131264",
    "client_firstname": "Harry",
    "client_lastname": "Hernandez",
    "client_doctype": "4",
    "client_numdoc": "1015467986",
    "response_url": "http://www.estrellas.pro/payments/response",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(title: 'Seleccionar medio de pago'),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(Uri.parse(url).toString()),
          method: "POST",
          body: Uint8List.fromList(
            formData.entries
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
        onUpdateVisitedHistory: (controller, uri, androidIsReload) {
          if (uri != null &&
              uri.toString().startsWith(formData["response_url"]!)) {
            // Captura los parámetros de la URL
            final uriParams = Uri.parse(uri.toString()).queryParameters;

            // Haz algo con los parámetros
            print("Datos capturados: $uriParams");

            // Por ejemplo, puedes mostrar un diálogo con los datos
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Datos recibidos"),
                content: Text(uriParams.toString()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Aceptar"),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
