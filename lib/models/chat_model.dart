import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageSender { me, stranger }

class ChatMessageModel {
  final String text;
  final MessageSender sender;
  final DateTime createdAt;
  final bool seen;

  ChatMessageModel({
    required this.text,
    required this.sender,
    required this.createdAt,
    this.seen = false,
  });

  factory ChatMessageModel.fromFirestore(Map<String, dynamic> json) {
    return ChatMessageModel(
      text: json['text'],
      sender: json['sender'] == 'me' ? MessageSender.me : MessageSender.stranger,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      seen: json['seen'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'text': text,
      'sender': sender == MessageSender.me ? 'me' : 'stranger',
      'createdAt': Timestamp.fromDate(createdAt),
      'seen': seen,
    };
  }
}
