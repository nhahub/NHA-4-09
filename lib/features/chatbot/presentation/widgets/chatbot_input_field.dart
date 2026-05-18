import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';

class ChatbotInputField extends StatelessWidget {
  final String sessionId;
  final bool isSending;
  final TextEditingController controller;
  final VoidCallback sendMessage;
  const ChatbotInputField({
    super.key,
    required this.sessionId,
    required this.isSending,
    required this.controller,
    required this.sendMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              enabled: !isSending,
              onSubmitted: (_) => sendMessage(),
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                filled: true,
                fillColor: const Color(0xffF0F0F0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: isSending ? Colors.grey.shade300 : AppColors.brandGreen,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                isSending ? Icons.hourglass_top : Icons.send,
                color: Colors.white,
              ),
              onPressed: isSending ? null : sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
