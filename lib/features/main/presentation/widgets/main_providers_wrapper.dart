import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../mood/data/repos/mood_repo.dart';
import '../../../mood/data/services/mood_local_service.dart';
import '../../../mood/presentation/manager/mood_cubit/mood_cubit.dart';
import '../../../payment/data/repos/subscription_repo.dart';
import '../../../payment/presentation/manager/subscription_cubit/subscription_cubit.dart';
import '../manager/main_cubit/main_cubit.dart';

class MainProvidersWrapper extends StatelessWidget {
  final Widget child;

  const MainProvidersWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              SubscriptionCubit(subscriptionRepo: getIt.get<SubscriptionRepo>())
                ..checkSubscription(),
        ),
        BlocProvider(
          create: (_) => MoodCubit(
            moodRepo: getIt.get<MoodRepo>(),
            moodLocalService: getIt.get<MoodLocalService>(),
          ),
        ),
        BlocProvider(create: (_) => MainCubit()),
      ],
      child: child,
    );
  }
}
