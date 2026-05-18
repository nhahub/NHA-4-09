import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../manager/chatbot_cubit/chatbot_cubit.dart';

class ChatSessionsFloatingButton extends StatelessWidget {
  const ChatSessionsFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: FloatingActionButton.extended(
        onPressed: () async {
          final cubit = context.read<ChatbotCubit>();
          final session = await cubit.createNewSession();

          if (!context.mounted) return;

          if (session != null) {
            context.push(Routes.chatbotView, args: session.id);
          }
        },
        backgroundColor: AppColors.brandGreen,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'New Chat',
          style: AppStyles.bold14.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
