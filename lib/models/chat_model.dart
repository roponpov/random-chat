enum MessageSender { me, stranger }

class ChatMessageModel {
  final String text;
  final MessageSender sender;
  final DateTime time;
  final bool seen;

  ChatMessageModel({
    required this.text,
    required this.sender,
    required this.time,
    this.seen = false,
  });
}
