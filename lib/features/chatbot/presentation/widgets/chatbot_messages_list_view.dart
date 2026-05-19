import 'package:flutter/material.dart';

import '../../data/models/chat_message_model.dart';
import '../manager/chatbot_cubit/chatbot_cubit.dart';
import 'chat_typing_indicator.dart';
import 'chatbot_bubble.dart';

class ChatbotMessagesListView extends StatelessWidget {
  final List<ChatMessageModel> messages;
  final ScrollController _scrollController;
  final ChatLoadedState state;
  const ChatbotMessagesListView({
    super.key,
    required ScrollController scrollController,
    required this.state,
    required this.messages,
  }) : _scrollController = scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      itemCount: state.messages.length + (state.isSending ? 1 : 0),
      itemBuilder: (context, index) {
        final messages = state.messages.reversed.toList();

        if (state.isSending && index == 0) {
          return const ChatTypingIndicator();
        }

        final messageIndex = state.isSending ? index - 1 : index;

        if (messageIndex < 0 || messageIndex >= messages.length) {
          return const SizedBox.shrink();
        }

        return ChatbotBubble(message: messages[messageIndex]);
      },
    );
  }
}
