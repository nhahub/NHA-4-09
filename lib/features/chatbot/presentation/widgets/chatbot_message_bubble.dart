import 'package:flutter/material.dart';
import 'package:moodly/core/functions/user_data_local.dart';
import 'package:moodly/core/widgets/user_avatar.dart';
import '../../data/models/chat_message_model.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../core/theming/app_colors.dart';

class ChatbotMessageBubble extends StatelessWidget {
  final ChatMessageModel message;

  const ChatbotMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) ...[
            const CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.brandGreen,
              child: Text(
                'M',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            const SizedBox(width: 6),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isUser ? AppColors.brandGreen : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: isUser
                      ? const Radius.circular(16)
                      : const Radius.circular(4),
                  bottomRight: isUser
                      ? const Radius.circular(4)
                      : const Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message.content,
                style: AppStyles.medium14.copyWith(
                  color: isUser ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 6),
            UserAvatar(
              name: getUser()!.name!,
              radius: 14,
              fontSize: 12,
              imageUrl: getUser()?.picture,
            ),
          ],
        ],
      ),
    );
  }
}
