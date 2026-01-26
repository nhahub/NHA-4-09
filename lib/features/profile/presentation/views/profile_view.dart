import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/fade_position.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/fade_scrollable.dart';
import '../../../auth/presentation/manager/auth_cubit/auth_cubit.dart';

class ProfileView extends StatelessWidget {
  final bool isPremium = false;
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          context.pushAndRemoveUntil(Routes.loginView);
        }
      },
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Profile",
          isPremium: isPremium,
          icon: AppAssets.searchIcon,
          onTap: () {},
        ),
        body: FadeScrollable(
          fadePosition: FadePosition.bottom,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                  },
                  icon: const Icon(Icons.logout, color: Colors.red),
                ),
              ),
              const Center(child: Text('Welcome to the Profile View!')),
            ],
          ),
        ),
      ),
    );
  }
}
