import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../settings/data/repos/update_profile_repo.dart';
import '../../../settings/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import '../../../settings/presentation/views/settings_view.dart';

class SettingsProvidersWrapper extends StatelessWidget {
  final bool isPremium;
  const SettingsProvidersWrapper({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdateProfileCubit(updateProfileRepo: getIt.get<UpdateProfileRepo>()),
      child: SettingsView(isPremium: isPremium),
    );
  }
}
