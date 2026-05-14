/*import 'package:flutter/material.dart';

import '../../../chatbot/presentation/views/start_chat_view.dart';

class ChatbotProvidersWrapper extends StatelessWidget {
  final bool isPremium;

  const ChatbotProvidersWrapper({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return StartChatView(isPremium: isPremium,);
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../chatbot/data/repos/chatbot_repo.dart';
import '../../../chatbot/presentation/manager/chatbot_cubit/chatbot_cubit.dart';
import '../../../chatbot/presentation/views/chat_sessions_view.dart';
import '../../../../core/services/get_it_service.dart';

class ChatbotProvidersWrapper extends StatelessWidget {
  final bool isPremium;

  const ChatbotProvidersWrapper({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatbotCubit(repo: getIt.get<ChatbotRepo>()),
      child: ChatSessionsView(isPremium: isPremium),
    );
  }
}