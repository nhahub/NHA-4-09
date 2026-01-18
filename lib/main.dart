import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/app/moodly_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: AppConstants.urlSubabase,
    anonKey: AppConstants.anonKey,
  );
  runApp(
    DevicePreview(
      enabled: true,
      devices: Devices.all,
      builder: (context) => const MoodlyApp(),
    ),
  );
}
