import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/chat_model.dart';
import '../../repositories/fake_chat_message_streaming_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final fakeStreaming = FakeChatMessageModelStreamingRepository();
  StreamSubscription? _subscription;

  ChatBloc() : super(ChatState()) {
    on<StartChatStream>((event, emit) {
      _subscription?.cancel();
      _subscription = fakeStreaming.fakeChatServerStream().listen((message) {
        add(NewMessageReceived(message));
      });
    });

    on<NewMessageReceived>((event, emit) {
      final updatedMessages = List<ChatMessageModel>.from(state.messages)
        ..add(event.message);

      emit(state.copyWith(messages: updatedMessages));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}