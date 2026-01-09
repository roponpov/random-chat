import '../../models/chat_model.dart';

class ChatState {
  final List<ChatMessageModel> messages;

  ChatState({this.messages = const []});

  ChatState copyWith({
    List<ChatMessageModel>? messages,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
    );
  }
}
