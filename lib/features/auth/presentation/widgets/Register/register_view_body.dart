import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/features/auth/presentation/cubit/authatcation_cubit.dart';
import 'package:moodly/features/auth/presentation/cubit/authatcation_state.dart';
import 'register_form_widget.dart';
import '../../../../../core/theming/app_assets.dart';

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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Registration successful! Please log in."),
                  backgroundColor: Colors.green,
                ),
              );

              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.loginView,
                (route) => false,
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                SvgPicture.asset(AppAssets.zenspunLogo, width: 90, height: 90),
                const SizedBox(height: 80),
                if (state is AuthLoading)
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  )
                else
                  const RegisterFormWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
