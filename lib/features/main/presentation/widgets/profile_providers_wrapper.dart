import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../auth/presentation/manager/logout_cubit/logout_cubit.dart';
import '../../../profile/data/repos/settings_repo.dart';
import '../../../profile/presentation/views/profile_view.dart';

class ProfileProvidersWrapper extends StatelessWidget {
  final bool isPremium;
  const ProfileProvidersWrapper({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(settingsRepo: getIt.get<SettingsRepo>()),

      child: ProfileView(key: const ValueKey('profile'), isPremium: isPremium),
    );
  }
}
