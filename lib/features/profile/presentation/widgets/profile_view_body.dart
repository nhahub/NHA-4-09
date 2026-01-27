import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enums/fade_position.dart';
import '../../../../core/widgets/fade_scrollable.dart';
import '../../../auth/presentation/manager/logout_cubit/logout_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeScrollable(
      fadePosition: FadePosition.bottom,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              context.read<LogoutCubit>().logout();
            },
            icon: const Icon(Icons.logout, color: Colors.red),
          ),
          const Center(child: Text('Welcome to the Profile View!')),
        ],
      ),
    );
  }
}
