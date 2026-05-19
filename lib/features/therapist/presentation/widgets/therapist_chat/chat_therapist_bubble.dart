import 'package:flutter/material.dart';
import '../../../../../core/functions/user_data_local.dart';
import '../../../../../core/widgets/user_avatar.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/booking_model.dart';
import '../../../data/models/message_model.dart';

class ChatTherapistBubble extends StatelessWidget {
  final BookingModel bookingModel;
  final MessageModel message;
  final bool isMe;
  final String userName;
  final String userImage;

  const ChatTherapistBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.bookingModel,
    required this.userName,
    required this.userImage,
  });

  @override
  Widget build(BuildContext context) {
    final currentUserId = getUser()!.userId;

    final bool isCurrentUserPatient = currentUserId == bookingModel.userId;

    final otherUserName = isCurrentUserPatient
        ? bookingModel.therapistName
        : userName;

    final otherUserImage = isCurrentUserPatient
        ? bookingModel.therapistImage
        : userImage;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!isMe)
            UserAvatar(
              name: otherUserName,
              radius: 18,
              fontSize: 16,
              imageUrl: otherUserImage,
            ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMe ? AppColors.brandGreen : Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isMe ? 16 : 4),
                  bottomRight: Radius.circular(isMe ? 4 : 16),
                ),
              ),
              child: Text(
                message.message,
                style: AppStyles.medium14.copyWith(
                  color: isMe ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
          if (isMe)
            UserAvatar(
              name: (getUser()!.name!),
              radius: 18,
              fontSize: 16,
              imageUrl: getUser()?.picture,
            ),
        ],
      ),
    );
  }
}
