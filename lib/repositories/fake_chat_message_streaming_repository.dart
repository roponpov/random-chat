import '../models/chat_model.dart';

class FakeChatMessageModelStreamingRepository {
  Stream<ChatMessageModel> fakeChatServerStream() async* {
    await Future.delayed(const Duration(seconds: 1));
    yield ChatMessageModel(
      text: 'Hey! Found someone finally.',
      sender: MessageSender.stranger,
      createdAt: DateTime.now(),
    );

    await Future.delayed(const Duration(seconds: 2));
    yield ChatMessageModel(
      text: 'Hello How are you ?👋',
      sender: MessageSender.me,
      createdAt: DateTime.now(),
      seen: true,
    );

    await Future.delayed(const Duration(seconds: 2));
    yield ChatMessageModel(
      text: 'Nice to meet you!',
      sender: MessageSender.stranger,
      createdAt: DateTime.now(),
    );
  }
}