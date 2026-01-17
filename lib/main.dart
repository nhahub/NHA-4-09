import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/app/moodly_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://bgvufvgufbeoojigmloh.supabase.co',
    anonKey: 'sb_publishable_DYO_UExNAMb3-hFrlflUiw_8VWprJ2U',
  );
  runApp(const MoodlyApp());
}
