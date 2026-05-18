import '../models/chat_message_model.dart';
import '../models/chat_session_model.dart';
import '../services/ai_chatbot_service.dart';
import '../services/chatbot_storage_service.dart';

class ChatbotRepo {
  final AIChatbotService _aiChatbotService;
  final ChatbotDatabaseService _databaseService;

  ChatbotRepo({
    required AIChatbotService aiChatbotService,
    required ChatbotDatabaseService databaseService,
  }) : _aiChatbotService = aiChatbotService,
       _databaseService = databaseService;

  // ── Sessions ──────────────────────────────────────────────────────────────

  Future<List<ChatSessionModel>> getSessions() =>
      _databaseService.getSessions();

  Future<ChatSessionModel> createSession(String title) =>
      _databaseService.createSession(title);

  Future<void> updateSessionTitle(String sessionId, String title) =>
      _databaseService.updateSessionTitle(sessionId, title);

  Future<void> deleteSession(String sessionId) =>
      _databaseService.deleteSession(sessionId);

  // ── Messages ──────────────────────────────────────────────────────────────

  Future<List<ChatMessageModel>> getMessages(String sessionId) =>
      _databaseService.getMessages(sessionId);

  /// Saves the user message, calls the AI, saves & returns the assistant reply.
  Future<ChatMessageModel> sendMessage({
    required String sessionId,
    required String userText,
    required List<ChatMessageModel> history,
  }) async {
    // 1. Persist the user message
    final userMsg = await _databaseService.saveMessage(
      sessionId: sessionId,
      role: 'user',
      content: userText,
    );

    // 2. Build history INCLUDING the new user message for context
    final fullHistory = [...history, userMsg];

    // 3. Call Gemini API
    final assistantText = await _aiChatbotService.getReply(
      history: fullHistory.map((msg) {
        return {'role': msg.role, 'content': msg.content};
      }).toList(),
    );

    // 4. Persist the assistant reply
    final assistantMsg = await _databaseService.saveMessage(
      sessionId: sessionId,
      role: 'assistant',
      content: assistantText,
    );

    return assistantMsg;
  }

  Future<void> clearMessages(String sessionId) =>
      _databaseService.clearMessages(sessionId);
}
