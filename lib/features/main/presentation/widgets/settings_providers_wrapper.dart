import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../auth/presentation/manager/logout_cubit/logout_cubit.dart';
import '../../../settings/data/repos/settings_repo.dart';
import '../../../settings/presentation/views/settings_view.dart';

class SettingsProvidersWrapper extends StatelessWidget {
  final bool isPremium;
  const SettingsProvidersWrapper({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(settingsRepo: getIt.get<SettingsRepo>()),
      child: SettingsView(
        key: const ValueKey('Settings'),
        isPremium: isPremium,
      ),
    );
  }
}
