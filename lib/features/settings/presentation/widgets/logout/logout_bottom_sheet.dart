import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import 'logout_title.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/functions/error_dialog.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../auth/presentation/manager/logout_cubit/logout_cubit.dart';
import 'logout_button.dart';
import 'logout_message.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          context.pushAndRemoveUntil(Routes.startView);
        } else if (state is LogoutFailureState) {
          errorDialog(context: context, message: state.message);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(kAppHorizontalPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LogoutTitle(),
            const SizedBox(height: 30),
            const LogoutMessage(),
            const SizedBox(height: 20),

            /// Logout Button
            BlocBuilder<LogoutCubit, LogoutState>(
              builder: (context, state) {
                return IgnorePointer(
                  ignoring: state is LogoutLoadingState,
                  child: LogoutButton(
                    text: "Logout",
                    isPrimary: true,
                    onPressed: () {
                      context.read<LogoutCubit>().logout();
                    },
                    child: state is LogoutLoadingState
                        ? const CustomCircularProgressIndicator()
                        : null,
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            /// Cancel Button
            LogoutButton(
              text: "Cancel",
              isPrimary: false,
              onPressed: () {
                context.pop();
              },
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
