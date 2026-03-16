import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/helpers/app_bloc_observer.dart';
import 'core/routing/deep_link_service.dart';
import 'core/services/cache_helper.dart';
import 'core/services/get_it_service.dart';
import 'core/services/supabase_initializer.dart';
import 'package:flutter_paymob/flutter_paymob.dart';
import 'core/networking/paymob_api_constants.dart';
import 'features/app/moodly_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await DeepLinkService.init();
  await CacheHelper.init();
  await setupGetIt();
  await SupabaseInitializer.init();
  Bloc.observer = AppBlocObserver();
  runApp(
    const MoodlyApp(),
    // DevicePreview(
    //   enabled: true,
    //   devices: Devices.all,
    //   builder: (_) => const MoodlyApp(),
    // ),
  );

  await FlutterPaymob.instance.initialize(
    apiKey: PaymobApiConstants.apiKey,
    integrationID: int.parse(PaymobApiConstants.integrationIdCard),
    walletIntegrationId: int.parse(PaymobApiConstants.integrationIdWallet),
    iFrameID: int.parse(PaymobApiConstants.iFrameIdCard),
  );

  runApp(const MoodlyApp());
}
