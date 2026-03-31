import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../auth/presentation/manager/logout_cubit/logout_cubit.dart';
import '../widgets/logout/logout_bottom_sheet.dart';

import '../../data/repos/settings_repo.dart';

Future<void> showLogoutBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return BlocProvider(
        create: (context) =>
            LogoutCubit(settingsRepo: getIt.get<SettingsRepo>()),
        child: const LogoutBottomSheet(),
      );
    },
  );
}
