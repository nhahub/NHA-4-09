import 'package:flutter/material.dart';
import 'package:moodly/core/functions/user_data_local.dart';
import 'package:moodly/core/widgets/user_avatar.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FB),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x140B1324),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        spacing: 14,
        children: [
          UserAvatar(
            name: getUser()!.name!,
            imageUrl: getUser()?.picture,
            radius: 30,
            fontSize: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text('@${getUser()!.name!}', style: AppStyles.bold20),
              Text(
                'Share your thoughts',
                style: AppStyles.medium17.copyWith(color: AppColors.bodyGray),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
