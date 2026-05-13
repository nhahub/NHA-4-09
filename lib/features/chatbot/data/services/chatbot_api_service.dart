import 'package:dio/dio.dart';

import '../models/chat_message_model.dart';

/// Calls the Claude API (mental health specialized system prompt).
/// Uses the same Dio instance registered in GetIt.
class ChatbotApiService {
  final Dio _dio;

  // ── Replace with your real key or load from environment / secure storage ──
  static const String _apiKey = 'YOUR_ANTHROPIC_API_KEY';
  static const String _apiUrl = 'https://api.anthropic.com/v1/messages';
  static const String _model = 'claude-opus-4-5';
  static const String _systemPrompt = '''
You are Mindy, a compassionate and professional mental wellness AI companion. 
Your role is to provide emotional support, evidence-based coping strategies, 
and mindfulness guidance. You are empathetic, non-judgmental, and always 
encourage users to seek professional help when needed.

Guidelines:
- Respond in the same language the user writes in (Arabic or English).
- Keep responses warm, concise, and supportive.
- Offer breathing exercises, grounding techniques, or journaling prompts when appropriate.
- If the user expresses thoughts of self-harm or crisis, always refer them to 
  a professional or crisis hotline immediately.
- Never diagnose or prescribe medication.
''';

  ChatbotApiService({required Dio dio}) : _dio = dio;

  /// Sends the full conversation history and returns the assistant reply.
  Future<String> sendMessage(List<ChatMessageModel> history) async {
    final messages = history
        .map(
          (m) => {
            'role': m.role,
            'content': m.content,
          },
        )
        .toList();

    final response = await _dio.post(
      _apiUrl,
      options: Options(
        headers: {
          'x-api-key': _apiKey,
          'anthropic-version': '2023-06-01',
          'content-type': 'application/json',
        },
      ),
      data: {
        'model': _model,
        'max_tokens': 1024,
        'system': _systemPrompt,
        'messages': messages,
      },
    );

    final content = response.data['content'] as List;
    return content.first['text'].toString();
  }
}
