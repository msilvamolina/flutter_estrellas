import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_estrellas/app/services/api_services.dart';
import 'package:http/http.dart';

class CompiRepository {
  ApiServices services = ApiServices();

  get json => null;

  Future<Either<String, String?>> compi({
    required String message,
  }) async {
    try {
      Map<String, dynamic> body = {
        "message": message,
        "filename": "documento_finanzas.pdf"
      };

      Response response = await services.postCompi(
        body: body,
      );

      String result = utf8.decode(response.bodyBytes);

      String? resultMessage;
      if (response.statusCode == 200) {
        resultMessage = result;
        resultMessage = resultMessage.replaceAll('{"message_from_compi":"', '');
        resultMessage = resultMessage.replaceAll('"}', '');
        resultMessage = resultMessage.trim();
        resultMessage = resultMessage.replaceAll(r'\n', '\n');
        resultMessage =
            resultMessage.replaceAll('¡Hola compa!', '¡Hola Estrella!');
        return right(resultMessage);
      }

      return left('Error al conectarse');
    } catch (e) {
      return left(e.toString());
    }
  }
}
