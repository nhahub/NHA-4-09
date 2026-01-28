import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants/constants.dart';
import 'core/routing/deep_link_service.dart';
import 'core/services/cache_helper.dart';
import 'core/services/get_it_service.dart';
import 'features/app/moodly_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await DeepLinkService.init();
  await CacheHelper.init();
  await setupGetIt();

  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabaseAnonKey,
  );

  runApp(
    const MoodlyApp(),
    // DevicePreview(
    //   enabled: true,
    //   devices: Devices.all,
    //   builder: (_) => const MoodlyApp(),
    // ),
  );
}
