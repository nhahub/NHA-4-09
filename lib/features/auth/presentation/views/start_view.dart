import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/theming/app_colors.dart';
import '../../data/repos/auth_repo.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../widgets/start/start_view_body.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(authRepo: getIt.get<AuthRepo>()),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
            ),
            child: Scaffold(
              body: ModalProgressHUD(
                inAsyncCall: state is LoginLoadingState,
                progressIndicator: const CircularProgressIndicator(
                  color: AppColors.brandGreen,
                ),
                child: const StartViewBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
