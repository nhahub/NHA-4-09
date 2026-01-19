import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/routing/navigation_service.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/features/auth/presentation/cubit/authatcation_cubit.dart';

import '../../core/routing/app_router.dart';
import '../../core/theming/theme_manager.dart';

class MoodlyApp extends StatelessWidget {
  const MoodlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthatcationCubit(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.getAppTheme(),
        onGenerateRoute: AppRouter.generateRoute,

        initialRoute: Routes.splashView,
      ),
    );
  }
}
