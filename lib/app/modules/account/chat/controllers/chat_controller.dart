import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../components/snackbars/snackbars.dart';
import '../../../../data/models/chat/chat_model.dart';
import '../../../../data/providers/repositories/chat/compi.dart';

class ChatController extends GetxController {
  CompiRepository compiRepository = CompiRepository();
  PageController pageController = PageController();
  MainController mainController = Get.find();

  String? _messageForCompi;
  String? get messageForCompi => _messageForCompi;

  bool _compiButtonEnabled = true;
  bool get compiButtonEnabled => _compiButtonEnabled;

  List<ChatModel> _listCompi = [];
  List<ChatModel> get listCompi => _listCompi;
  TextEditingController compiTextController = TextEditingController(text: '');

  @override
  void onInit() {
    _listCompi.add(
      ChatModel(
        text:
            '¡Hola! Soy Compi, tu asistente virtual de educación financiera. ¿Cómo puedo ayudarte hoy?',
        isCompi: true,
        isLoading: false,
      ),
    );
    super.onInit();
  }

  void onCompiFieldChange(String? value) {
    _messageForCompi = value?.trim();
    _compiButtonEnabled = false;
    if (value != null) {
      _compiButtonEnabled = value.length > 0;
    }
    update(['compiList']);
  }

  @override
  void dispose() {
    removeCompiLoading();
    super.dispose();
  }

  void compiStart() async {
    if (_messageForCompi != null) {
      _listCompi.add(
        ChatModel(
          text: _messageForCompi!,
          isCompi: false,
          isLoading: false,
        ),
      );
      _listCompi.add(
        ChatModel(
          text: '',
          isCompi: true,
          isLoading: true,
        ),
      );
      _compiButtonEnabled = false;
      compiTextController.text = "";
      update(['compiList']);
      Either<String, String?> response =
          await compiRepository.compi(message: _messageForCompi!);
      removeCompiLoading();
      response.fold(
        (failure) => Snackbars.error(failure),
        (compiMessage) {
          _listCompi.add(
            ChatModel(
              text: compiMessage ?? '',
              isCompi: true,
              isLoading: false,
            ),
          );
        },
      );
    }
  }

  void removeCompiLoading() {
    int index = listCompi.length - 1;
    ChatModel model = listCompi[index];

    if (model.isLoading) {
      listCompi.removeAt(index);
      _compiButtonEnabled = true;
    }
    update(['compiList']);
  }
}
