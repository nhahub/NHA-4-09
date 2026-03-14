import 'package:flutter/material.dart';
import 'package:moodly/core/functions/get_user.dart';

import '../../../data/models/message_model.dart';
import 'chat_bubble.dart';

class MessagesList extends StatelessWidget {
  final List<MessageModel> messages;
  final ScrollController controller;

  const MessagesList({
    super.key,
    required this.messages,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      reverse: true,
      itemCount: messages.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemBuilder: (context, index) {
        final msg = messages[messages.length - 1 - index];
        return ChatBubble(
          message: msg,
          isMe: msg.senderId == getUser()!.userId,
        );
      },
    );
  }
}
