import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants/app_keys.dart';

class SupabaseInitializer {
  static Future<void> init() async {
    await Supabase.initialize(
      url: ApiKeys.supabaseUrl,
      anonKey: ApiKeys.supabaseAnonKey,
    );
  }
}
