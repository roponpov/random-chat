import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/chat_model.dart';

class FirebaseChatRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<ChatMessageModel> messageStream(String chatId) {
    return _firestore
      .collection('chats')
      .doc(chatId)
      .collection('messages')
      .orderBy('createdAt')
      .snapshots()
      .expand((snapshot) =>
      snapshot.docChanges.map((change) {
        return ChatMessageModel.fromFirestore(
          change.doc.data()!,
        );
      }));
  }

  Future<void> sendMessage({
    required String chatId,
    required ChatMessageModel message,
  }) {
    return _firestore
      .collection('chats')
      .doc(chatId)
      .collection('messages')
      .add(message.toFirestore());
  }
}
