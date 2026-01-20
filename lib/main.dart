import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/routing/deep_link_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/app/moodly_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await DeepLinkService.init();

  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabaseAnonKey,
  );

  runApp(
    DevicePreview(
      enabled: true,
      devices: Devices.all,
      builder: (_) => const MoodlyApp(),
    ),
  );
}
