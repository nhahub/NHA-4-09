import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/extensions/context_extensions.dart';

import '../../../../../core/extensions/spacing.dart';
import '../../../../../core/helpers/snackbar_service.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../cubit/authatcation_cubit.dart';
import '../../cubit/authatcation_state.dart';
import 'login_form_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: BlocConsumer<AuthatcationCubit, AuthatcationState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Future.delayed(const Duration(milliseconds: 300), () {
                // ignore: use_build_context_synchronously
                context.pushAndRemoveUntil(Routes.mainView);
              });
            } else if (state is AuthFailure) {
              CustomSnackbar.show(context, state.message, isError: true);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    gapHeight(50),
                    SvgPicture.asset(
                      AppAssets.zenspunLogo,
                      width: 90,
                      height: 90,
                    ),
                    gapHeight(80),

                    if (state is AuthLoading)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: CircularProgressIndicator(),
                      )
                    else
                      const LoginFormWidget(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
