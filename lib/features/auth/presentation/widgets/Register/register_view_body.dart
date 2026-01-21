import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/extensions/spacing.dart';
import '../../../../../core/helpers/snackbar_service.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../cubit/authatcation_cubit.dart';
import '../../cubit/authatcation_state.dart';
import 'register_form_widget.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: BlocConsumer<AuthatcationCubit, AuthatcationState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              CustomSnackbar.show(context, "Registration Successful");

              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.loginView,
                (route) => false,
              );
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
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(),
                      )
                    else
                      const RegisterFormWidget(),
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
//hazemhamdy135@gamil.com
//Ahmed@1215