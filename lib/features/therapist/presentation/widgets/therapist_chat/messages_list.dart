import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/functions/user_data_local.dart';
import '../../../data/models/booking_model.dart';
import '../../../data/models/message_model.dart';
import 'chat_therapist_bubble.dart';

class MessagesList extends StatelessWidget {
  final bool isLoading;
  final BookingModel bookingModel;
  final List<MessageModel> messages;
  final ScrollController controller;
  final String userName;
  final String userImage;

  const MessagesList({
    super.key,
    required this.messages,
    required this.controller,
    this.isLoading = false,
    required this.bookingModel,
    required this.userName,
    required this.userImage,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: Colors.grey[50],
      enabled: isLoading,
      child: ListView.separated(
        controller: controller,
        reverse: true,
        itemCount: messages.length,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8);
        },
        itemBuilder: (context, index) {
          final msg = messages[messages.length - 1 - index];
          return ChatTherapistBubble(
            message: msg,
            isMe: msg.senderId == getUser()!.userId,
            bookingModel: bookingModel,
            userName: userName,
            userImage: userImage,
          );
        },
      ),
    );
  }
}
