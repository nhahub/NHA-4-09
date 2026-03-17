import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'features/payment/data/services/paymob_service.dart';
import 'features/payment/data/services/stripe_service.dart';
import 'core/helpers/app_bloc_observer.dart';
import 'core/routing/deep_link_service.dart';
import 'core/services/cache_helper.dart';
import 'core/services/get_it_service.dart';
import 'core/services/supabase_initializer.dart';
import 'features/app/moodly_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await DeepLinkService.init();
  await CacheHelper.init();
  await setupGetIt();
  await SupabaseInitializer.init();
  await StripeService.init();
  await PaymobService.init();
  Bloc.observer = AppBlocObserver();

  runApp(
    const MoodlyApp(),
    // DevicePreview(
    //   enabled: true,
    //   devices: Devices.all,
    //   builder: (_) => const MoodlyApp(),
    // ),
  );
}
