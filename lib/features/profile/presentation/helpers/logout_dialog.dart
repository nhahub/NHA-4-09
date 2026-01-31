import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../auth/presentation/manager/logout_cubit/logout_cubit.dart';

Future<void> logoutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (dialogContext) {
      return CustomDialog(
        buttonText: "Logout",
        bodyContent: "Are you sure you want to logout?",
        title: "Logout?",
        buttonColor: AppColors.darkRed,
        onPressed: () async {
          dialogContext.pop();
          context.read<LogoutCubit>().logout();
        },
      );
    },
  );
}
