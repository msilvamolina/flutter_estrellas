import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';

import 'package:get/get.dart';

import '../../../../data/models/chat/chat_model.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(title: 'Chat con Estrellita'),
      body: GetBuilder<ChatController>(
        id: 'compiList',
        builder: (controller) {
          Iterable<ChatModel> reversedList = controller.listCompi.reversed;
          return Column(
            children: [
              Expanded(
                child: ListView(
                  reverse: true,
                  padding: const EdgeInsets.all(16),
                  children: [
                    for (ChatModel element in reversedList) ...[
                      if (element.isCompi)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: !element.isLoading
                              ? _buildReceivedMessage(element.text)
                              : _compiIsLoading(),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _buildSentMessage(element.text),
                        ),
                    ],
                  ],
                ),
              ),
              _buildChatInput(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildReceivedMessage(String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage:
              AssetImage('assets/images/chatAI.png'), // Avatar de Compi
          radius: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: secondaryBase, // Púrpura oscuro para Compi
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white, // Texto blanco para buen contraste
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _compiIsLoading() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage:
              AssetImage('assets/images/chatAI.png'), // Avatar de Compi
          radius: 20,
        ),
        const SizedBox(width: 16),
        CircularProgressIndicator(),
      ],
    );
  }

  // Mensaje enviado (Usuario)
  Widget _buildSentMessage(String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: neutral100, // Fondo amarillo para usuario
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black, // Texto negro para contraste en amarillo
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Input para enviar mensajes
  Widget _buildChatInput() {
    ChatController homeController = Get.find<ChatController>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: neutral300,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: homeController.compiTextController,
                  enabled: homeController.compiButtonEnabled,
                  onChanged: homeController.onCompiFieldChange,
                  decoration: InputDecoration(
                    hintText: 'Escribe un mensaje...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: homeController.compiButtonEnabled
                    ? primaryBase
                    : primaryBase.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: homeController.compiButtonEnabled
                      ? neutral900
                      : neutral900.withOpacity(0.2),
                ),
                onPressed: homeController.compiButtonEnabled
                    ? () {
                        homeController.compiStart();
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
