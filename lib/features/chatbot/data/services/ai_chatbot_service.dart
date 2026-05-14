import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:moodly/core/helpers/logger.dart';

import '../../../../core/constants/app_keys.dart';
import '../../../../core/networking/api_error_handler.dart';

class AIChatbotService {
  final GenerativeModel _model;

  AIChatbotService()
    : _model = GenerativeModel(
        model: 'gemini-2.5-flash',
        apiKey: ApiKeys.googleAiApiKey,
      );

  static const String _systemPrompt = '''
You are a mental health support AI assistant.

Rules:
- Only answer questions related to mental health, stress, anxiety, emotions, mindfulness, self-care, habits, and wellbeing.
- If the user asks about unrelated topics like programming, math, politics, hacking, or technology, politely refuse.
- Do not pretend to be a licensed therapist, psychologist, or doctor.
- Avoid giving dangerous medical advice or diagnoses.
- Encourage users to seek professional help for serious mental health situations.
- Keep responses supportive, calm, empathetic, and easy to understand.
- Keep responses short and clear.
''';

  Future<String> getReply({required List<Map<String, String>> history}) async {
    try {
      final prompt = StringBuffer();

      prompt.writeln(_systemPrompt);
      prompt.writeln();

      for (final message in history) {
        prompt.writeln('${message['role']}: ${message['content']}');
      }

      final response = await _model.generateContent([
        Content.text(prompt.toString()),
      ]);

      return response.text?.trim() ?? "Sorry, I couldn't generate a response.";
    } catch (e) {
      Logger.log('AIChatbotService.getReply error: $e');
      return _handleError(e);
    }
  }

  Stream<String> getReplyStream({required String message}) async* {
    try {
      final prompt =
          '''
$_systemPrompt

User:
$message
''';

      final stream = _model.generateContentStream([Content.text(prompt)]);

      String text = '';

      await for (final chunk in stream) {
        if (chunk.text != null) {
          text += chunk.text!;
          yield text.trim();
        }
      }

      if (text.isEmpty) {
        yield "Sorry, I couldn't generate a response.";
      }
    } catch (e) {
      yield _handleError(e);
    }
  }

  String _handleError(Object e) {
    final error = e.toString();

    if (error.contains('API_KEY_INVALID')) {
      return 'Invalid API key.';
    }

    if (error.contains('QUOTA_EXCEEDED')) {
      return 'Quota exceeded. Try again later.';
    }

    if (error.contains('SAFETY')) {
      return 'Message blocked for safety reasons.';
    }

    return ApiErrorHandler.handle(error: e).message;
  }
}
