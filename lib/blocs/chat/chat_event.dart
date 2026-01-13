import '../../models/chat_model.dart';

sealed class ChatEvent {}

class StartChatStream extends ChatEvent {}

class NewMessageReceived extends ChatEvent {
  final ChatMessageModel message;
  NewMessageReceived(this.message);
}

class SendMessage extends ChatEvent {
  final ChatMessageModel message;
  SendMessage(this.message);
}