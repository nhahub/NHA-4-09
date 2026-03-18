import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/payment/data/repos/subscription_repo.dart';
import 'package:moodly/features/payment/presentation/manager/subscription_cubit/subscription_cubit.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../Community/presentation/views/community_view.dart';
import '../../../chatbot/presentation/views/chatbot_view.dart';
import '../../../home/data/repos/water_repo.dart';
import '../../../home/presentation/manager/cups_of_water_cubit/water_tracking_cubit.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../meditations/presentation/views/meditations_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../../therapist/data/repos/therapist_repo.dart';
import '../../../therapist/presentation/manager/therapist_cubit/therapist_cubit.dart';
import '../widgets/main_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SubscriptionCubit(subscriptionRepo: getIt.get<SubscriptionRepo>())
            ..loadSubscription(),
      child: Builder(
        builder: (context) {
          return BlocSelector<SubscriptionCubit, SubscriptionState, bool>(
            selector: (state) =>
                state is SubscriptionSuccessState ? state.isPremium : false,
            builder: (context, isPremium) {
              final List<Widget> screens = [
                MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (_) =>
                          WaterTrackingCubit(waterRepo: getIt.get<WaterRepo>())
                            ..loadData(),
                    ),
                    BlocProvider(
                      create: (_) => TherapistCubit(
                        therapistRepo: getIt.get<TherapistRepo>(),
                      )..getTherapists(),
                    ),
                  ],
                  child: HomeView(
                    key: const ValueKey('home'),
                    isPremium: isPremium,
                  ),
                ),
                CommunityView(
                  key: const ValueKey('community'),
                  isPremium: isPremium,
                ),
                MeditationsView(
                  key: const ValueKey('meditations'),
                  isPremium: isPremium,
                ),
                ChatbotView(
                  key: const ValueKey('chatbot'),
                  isPremium: isPremium,
                ),
                ProfileView(
                  key: const ValueKey('profile'),
                  isPremium: isPremium,
                ),
              ];

              return Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        switchInCurve: Curves.easeIn,
                        switchOutCurve: Curves.easeOut,
                        transitionBuilder: (child, animation) {
                          final offsetAnimation = Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(animation);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                        child: IndexedStack(
                          key: ValueKey(_currentIndex),
                          index: _currentIndex,
                          children: screens,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: MainNavBar(
                          selectedIndex: _currentIndex,
                          onTap: _onTabSelected,
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
