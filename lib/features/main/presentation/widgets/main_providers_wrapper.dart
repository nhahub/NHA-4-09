import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/get_it_service.dart';
import '../manager/main_cubit/main_cubit.dart';
import '../../../payment/data/repos/subscription_repo.dart';
import '../../../payment/presentation/manager/subscription_cubit/subscription_cubit.dart';

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
                ..loadSubscription(),
        ),
        BlocProvider(create: (_) => MainCubit()),
      ],
      child: child,
    );
  }
}
