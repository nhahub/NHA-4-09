import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../../../auth/presentation/cubit/authatcation_cubit.dart';
import '../../../auth/presentation/cubit/authatcation_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthatcationCubit, AuthatcationState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.loginView,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  context.read<AuthatcationCubit>().logout();
                },
                icon: const Icon(Icons.logout, color: Colors.red),
              ),
            ),
            const Center(child: Text('Welcome to the Profile View!')),
          ],
        ),
      ),
    );
  }
}
