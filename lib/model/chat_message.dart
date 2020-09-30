class ChatMessage {
  final int result;
  final String content;

  ChatMessage({this.result, this.content});

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      result: json['result'] as int,
      content: json['content'] as String,
    );
  }
}
