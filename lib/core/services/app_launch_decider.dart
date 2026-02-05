import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/routing/deep_link_state.dart';
import 'package:moodly/core/services/get_it_service.dart';
import 'package:moodly/features/auth/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:moodly/features/auth/presentation/views/reset_password_view.dart';
import 'package:moodly/features/auth/presentation/views/start_view.dart';
import 'package:moodly/features/main/presentation/views/main_view.dart';
import 'package:moodly/features/profile/data/repos/settings_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppLaunchDecider {
  static Widget decideStartView() {
    if (DeepLinkState.openedFromResetLink) {
      DeepLinkState.openedFromResetLink = false;
      return const ResetPasswordView();
    }

    final Session? session = Supabase.instance.client.auth.currentSession;

    return session != null
        ? BlocProvider(
            create: (_) => LogoutCubit(settingsRepo: getIt.get<SettingsRepo>()),
            child: const MainView(),
          )
        : const StartView();
  }
}
