import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/manager/network_cubit/network_cubit.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../chatbot/data/repos/chatbot_repo.dart';
import '../../../chatbot/presentation/manager/chatbot_cubit/chatbot_cubit.dart';
import '../../../chatbot/presentation/views/chat_sessions_view.dart';

class ChatbotProvidersWrapper extends StatelessWidget {
  final bool isPremium;

  const ChatbotProvidersWrapper({super.key, required this.isPremium});
  void _retryRequests(BuildContext context) {
    context.read<ChatbotCubit>().loadSessions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatbotCubit(repo: getIt.get<ChatbotRepo>())..loadSessions(),
      child: BlocListener<NetworkCubit, NetworkState>(
        listener: (context, state) {
          if (state.status == NetworkStatus.reconnected) {
            _retryRequests(context);
          }
        },
        child: ChatSessionsView(isPremium: isPremium),
      ),
    );
  }
}
