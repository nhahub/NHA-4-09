import 'package:flutter/material.dart';
import 'package:moodly/features/therapist/data/models/message_model.dart';
import 'chat_bubble.dart';

class MessagesList extends StatelessWidget {
  final List<MessageModel> messages;
  final String currentUserId;
  final ScrollController controller;

  const MessagesList({
    super.key,
    required this.messages,
    required this.currentUserId,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[messages.length - 1 - index];
        return ChatBubble(
          message: msg,
          isMe: msg.senderId == currentUserId,
        );
      },
    );
  }
}