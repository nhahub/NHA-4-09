import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/custom_circle_button.dart';
import '../manager/chatbot_cubit/chatbot_cubit.dart';

class ChatbotAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String sessionId;

  const ChatbotAppBar({super.key, required this.sessionId});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Center(
        child: Transform.scale(
          scale: 0.8,
          child: CustomCircleButton(
            icon: AppAssets.arrowLeftIosIcon,
            onTap: () => context.pop(),
            backgroundcolor: Colors.white,
          ),
        ),
      ),
      title: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.brandGreen,
            child: Text(
              'M',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Moodly',
                style: AppStyles.bold14.copyWith(color: Colors.black),
              ),
              Text(
                'Mental Wellness AI',
                style: AppStyles.medium15.copyWith(color: Colors.black45),
              ),
            ],
          ),
        ],
      ),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onSelected: (value) {
            if (value == 'clear') {
              context.read<ChatbotCubit>().clearChat(sessionId);
            }
          },
          itemBuilder: (_) => const [
            PopupMenuItem(
              value: 'clear',
              child: Row(
                children: [
                  Icon(Icons.delete_outline, size: 18, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Clear Chat', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
