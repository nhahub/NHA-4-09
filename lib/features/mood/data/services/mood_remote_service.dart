import 'package:moodly/features/mood/data/models/mood_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MoodRemoteService {
  final SupabaseClient client;

  MoodRemoteService(this.client);

  Future<void> insertMood(MoodModel mood, String userId) async {
    await client.from('user_moods').insert(mood.toMap(userId));
  }

  Future<List<Map<String, dynamic>>> getTodayMood(String userId) async {
    final today = DateTime.now();
    final start = DateTime(today.year, today.month, today.day);

    return await client
        .from('user_moods')
        .select()
        .eq('user_id', userId)
        .eq('mood_type', 'daily')
        .gte('created_at', start.toIso8601String());
  }
}
