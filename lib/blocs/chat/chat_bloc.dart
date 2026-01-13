import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/firebase_chat_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import '../../models/chat_model.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FirebaseChatRepository repository;
  StreamSubscription? _subscription;
  final String chatId = 'chat_demo_1';

  ChatBloc(this.repository) : super(ChatState()) {
    on<StartChatStream>((event, emit) {
      _subscription?.cancel();
      _subscription = repository.messageStream(chatId).listen((message) {
        add(NewMessageReceived(message));
      });
    });

    on<NewMessageReceived>((event, emit) {
      final updatedMessages = List<ChatMessageModel>.from(state.messages)
        ..add(event.message);

      emit(state.copyWith(messages: updatedMessages));
    });

    on<SendMessage>((event, emit) async {
      await repository.sendMessage(
        chatId: chatId,
        message: event.message,
      );
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}