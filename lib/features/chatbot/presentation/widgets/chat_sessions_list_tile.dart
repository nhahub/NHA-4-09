import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/format_time_ago.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../data/models/chat_session_model.dart';

class ChatSessionsListTile extends StatelessWidget {
  const ChatSessionsListTile({super.key, required this.session});

  final ChatSessionModel session;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: const CircleAvatar(
        backgroundColor: AppColors.brandGreen,
        child: Icon(Icons.chat, color: Colors.white, size: 18),
      ),
      title: Text(
        session.title,
        style: AppStyles.bold14,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        session.updatedAt.formatTimeAgo(),
        style: AppStyles.medium15.copyWith(color: Colors.black45),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.black38),
      onTap: () => context.push(Routes.chatbotView, args: session.id),
    );
  }
}
