import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/chat_message_model.dart';
import '../../../data/models/chat_session_model.dart';
import '../../../data/repos/chatbot_repo.dart';

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  final ChatbotRepo _repo;

  ChatbotCubit({required ChatbotRepo repo})
      : _repo = repo,
        super(ChatSessionsLoadingState());

  // ── Sessions ───────────────────────────────────────────────────────────────

  Future<void> loadSessions() async {
    emit(ChatSessionsLoadingState());
    try {
      final sessions = await _repo.getSessions();
      emit(ChatSessionsLoadedState(sessions: sessions));
    } catch (e) {
      emit(ChatSessionsFailureState(
          message: ApiErrorHandler.handle(error: e).message));
    }
  }

  Future<ChatSessionModel?> createNewSession() async {
    try {
      final session = await _repo.createSession('New Chat');
      await loadSessions();
      return session;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteSession(String sessionId) async {
    try {
      await _repo.deleteSession(sessionId);
      await loadSessions();
    } catch (_) {}
  }

  // ── Active chat ────────────────────────────────────────────────────────────

  Future<void> loadMessages(String sessionId) async {
    emit(ChatLoadingState());
    try {
      final messages = await _repo.getMessages(sessionId);
      emit(ChatLoadedState(messages: messages));
    } catch (e) {
      emit(ChatFailureState(
          message: ApiErrorHandler.handle(error: e).message));
    }
  }

  Future<void> sendMessage({
    required String sessionId,
    required String text,
  }) async {
    final currentState = state;
    if (currentState is! ChatLoadedState) return;

    // Optimistically add user message to UI
    final optimisticUser = ChatMessageModel(
      id: 'temp_${DateTime.now().millisecondsSinceEpoch}',
      sessionId: sessionId,
      userId: '',
      role: 'user',
      content: text,
      createdAt: DateTime.now(),
    );

    emit(currentState.copyWith(
      messages: [...currentState.messages, optimisticUser],
      isSending: true,
    ));

    try {
      // sendMessage saves user msg, calls API, saves & returns assistant msg
      // final assistantMsg = await _repo.sendMessage(
      //   sessionId: sessionId,
      //   userText: text,
      //   history: currentState.messages, // history WITHOUT the optimistic entry
      // );

      // Replace optimistic user msg with real one from DB + add assistant
      final fresh = await _repo.getMessages(sessionId);
      emit(ChatLoadedState(messages: fresh, isSending: false));

      // Auto-title the session from first user message
      if (currentState.messages.isEmpty) {
        final title =
            text.length > 40 ? '${text.substring(0, 40)}…' : text;
        await _repo.updateSessionTitle(sessionId, title);
      }
    } catch (e) {
      // Remove optimistic message on failure
      emit(currentState.copyWith(isSending: false));
      emit(ChatFailureState(
          message: ApiErrorHandler.handle(error: e).message));
    }
  }

  Future<void> clearChat(String sessionId) async {
    try {
      await _repo.clearMessages(sessionId);
      emit(const ChatLoadedState(messages: []));
    } catch (_) {}
  }
}
