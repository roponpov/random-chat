import 'package:flutter/material.dart';

import 'chat_app_bar_section.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: ChatAppBarSection(theme: theme),
      body: const Center(
        child: Text('Chat Screen'),
      ),
    );
  }
}
