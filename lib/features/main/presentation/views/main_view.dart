import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../payment/presentation/manager/subscription_cubit/subscription_cubit.dart';
import '../helpers/main_screens.dart';
import '../manager/main_cubit/main_cubit.dart';
import '../widgets/main_nav_bar.dart';
import '../widgets/main_providers_wrapper.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainProvidersWrapper(
      child: BlocSelector<SubscriptionCubit, SubscriptionState, bool>(
        selector: (state) =>
            state is SubscriptionSuccessState ? state.isPremium : false,
        builder: (context, isPremium) {
          final screens = MainScreens.build(isPremium: isPremium);

          return BlocBuilder<MainCubit, int>(
            builder: (context, currentIndex) {
              return Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: IndexedStack(
                          key: ValueKey(currentIndex),
                          index: currentIndex,
                          children: screens,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: MainNavBar(
                          selectedIndex: currentIndex,
                          onTap: (index) =>
                              context.read<MainCubit>().changeTab(index),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
