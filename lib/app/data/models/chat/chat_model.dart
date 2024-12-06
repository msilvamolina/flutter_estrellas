class ChatModel {
  ChatModel({
    required this.text,
    required this.isCompi,
    required this.isLoading,
  });

  final String text;
  final bool isCompi;
  final bool isLoading;

  @override
  String toString() =>
      'ChatModel(isLoading: $isLoading, text: $text, isCompi: $isCompi)';
}
