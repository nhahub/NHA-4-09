import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/functions/build_snack_bar.dart';
import '../../../../core/functions/error_dialog.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../auth/presentation/manager/logout_cubit/logout_cubit.dart';
import '../widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  final bool isPremium;
  const SettingsView({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          successSnackBar(context: context, message: "Logout Success");
          context.pushAndRemoveUntil(Routes.startView);
        } else if (state is LogoutFailureState) {
          errorDialog(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LogoutLoadingState,
          progressIndicator: const CustomCircularProgressIndicator(
            color: AppColors.brandGreen,
          ),
          child: Scaffold(
            appBar: CustomAppbar(
              title: "Settings",
              isPremium: isPremium,
              onTap: () {},
            ),
            body: const SettingsViewBody(),
          ),
        );
      },
    );
  }
}
