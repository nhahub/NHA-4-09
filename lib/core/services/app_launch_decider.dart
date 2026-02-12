import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/onboarding/data/Services/onboarding_local_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/auth/presentation/manager/logout_cubit/logout_cubit.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/auth/presentation/views/start_view.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/profile/data/repos/settings_repo.dart';
import '../routing/deep_link_state.dart';
import 'get_it_service.dart';

class AppLaunchDecider {
  static Widget decideStartView() {
    if (DeepLinkState.openedFromResetLink) {
      DeepLinkState.openedFromResetLink = false;
      return const ResetPasswordView();
    }

    final Session? session = Supabase.instance.client.auth.currentSession;
    final bool hasSeenOnboarding = OnboardingLocalService.hasSeenOnboarding();

    if (!hasSeenOnboarding) {
      return const StartView();
    }
    
    if (session == null) {
      return const StartView();
    }

    return BlocProvider(
      create: (_) => LogoutCubit(settingsRepo: getIt.get<SettingsRepo>()),
      child: const MainView(),
    );
  }
}
