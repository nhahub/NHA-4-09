import '../models/chat_message_model.dart';
import '../models/chat_session_model.dart';
import '../services/chatbot_api_service.dart';
import '../services/chatbot_storage_service.dart';

class ChatbotRepo {
  final ChatbotApiService _apiService;
  final ChatbotStorageService _storageService;

  ChatbotRepo({
    required ChatbotApiService apiService,
    required ChatbotStorageService storageService,
  })  : _apiService = apiService,
        _storageService = storageService;

  // ── Sessions ──────────────────────────────────────────────────────────────

  Future<List<ChatSessionModel>> getSessions() => _storageService.getSessions();

  Future<ChatSessionModel> createSession(String title) =>
      _storageService.createSession(title);

  Future<void> updateSessionTitle(String sessionId, String title) =>
      _storageService.updateSessionTitle(sessionId, title);

  Future<void> deleteSession(String sessionId) =>
      _storageService.deleteSession(sessionId);

  // ── Messages ──────────────────────────────────────────────────────────────

  Future<List<ChatMessageModel>> getMessages(String sessionId) =>
      _storageService.getMessages(sessionId);

  /// Saves the user message, calls the AI, saves & returns the assistant reply.
  Future<ChatMessageModel> sendMessage({
    required String sessionId,
    required String userText,
    required List<ChatMessageModel> history,
  }) async {
    // 1. Persist the user message
    final userMsg = await _storageService.saveMessage(
      sessionId: sessionId,
      role: 'user',
      content: userText,
    );

    // 2. Build history INCLUDING the new user message for context
    final fullHistory = [...history, userMsg];

    // 3. Call Claude API
    final assistantText = await _apiService.sendMessage(fullHistory);

    // 4. Persist the assistant reply
    final assistantMsg = await _storageService.saveMessage(
      sessionId: sessionId,
      role: 'assistant',
      content: assistantText,
    );

    return assistantMsg;
  }

  Future<void> clearMessages(String sessionId) =>
      _storageService.clearMessages(sessionId);
}
