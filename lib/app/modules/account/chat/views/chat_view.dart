import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/models/chat/chat_model.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              AssetImage('assets/images/compi.png'), // Avatar de Compi
          radius: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:
                  Colors.purple.withOpacity(0.8), // Púrpura oscuro para Compi
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
              AssetImage('assets/images/compi.png'), // Avatar de Compi
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
              color: Colors.yellow[700], // Fondo amarillo para usuario
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
        const SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: Colors.purple,
          radius: 20,
          child: Image.network(
              'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745'),
        ),
      ],
    );
  }

  // Input para enviar mensajes
  Widget _buildChatInput() {
    ChatController homeController = Get.find<ChatController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
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
                  ? Colors.purple
                  : Colors.purple.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.send,
                color: homeController.compiButtonEnabled
                    ? Colors.white
                    : Colors.white.withOpacity(0.2),
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
    );
  }
}
