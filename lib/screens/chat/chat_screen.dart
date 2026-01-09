import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/chat/chat_bloc.dart';
import '../../blocs/chat/chat_event.dart';
import '../../blocs/chat/chat_state.dart';
import '../../models/chat_model.dart';
import '../../widgets/text_form_field_widget.dart';
import 'chat_app_bar_section.dart';
import 'random_user_message_section.dart';
import 'user_message_section.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return BlocProvider(
      create: (context) => ChatBloc()..add(StartChatStream()),
      child: Scaffold(
        appBar: ChatAppBarSection(theme: theme),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                'TODAY 10:23 PM',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onPrimary.withValues(alpha: .5),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Text(
                  'Connected with a random stranger',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onPrimary.withValues(alpha: .5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Expanded(
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final message = state.messages[index];

                        if (message.sender == MessageSender.me) {
                          return UserMessageSection(
                            message: message,
                          );
                        } else {
                          return RandomUserMessageSection(
                            message: message,
                          );
                        }
                      },
                    );
                  },
                ),
              ),


            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: theme.colorScheme.primary.withValues(alpha: .5),
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            spacing: 10,
            children: [
              Expanded(
                child: TextFormFieldWidget(
                  contentPending: EdgeInsets.all(16),
                  hintText: 'Type a message...',
                ),
              ),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.send_rounded,
                  size: 25,
                  color: theme.colorScheme.onPrimary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
