import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants/constants.dart';

class SupabaseInitializer {
  static Future<void> init() async {
    await Supabase.initialize(
      url: AppConstants.supabaseUrl,
      anonKey: AppConstants.supabaseAnonKey,
    );
  }
}
