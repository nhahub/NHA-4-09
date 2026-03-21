import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/functions/get_user.dart';

class MoodProgressService {
  final SupabaseClient supabase;

  MoodProgressService({required this.supabase});

  Future<List<dynamic>> _fetchMoods(String rpcName) async {
    final response = await supabase.rpc(
      rpcName,
      params: {'p_user_id': getUser()!.userId},
    );

    return response;
  }

  Future<List<dynamic>> getCurrentWeekMood() {
    return _fetchMoods('get_current_week_moods');
  }

  Future<List<dynamic>> getCurrentMonthMood() {
    return _fetchMoods('get_current_month_moods');
  }

  Future<List<dynamic>> getCurrentYearMood() {
    return _fetchMoods('get_current_year_moods');
  }
}
