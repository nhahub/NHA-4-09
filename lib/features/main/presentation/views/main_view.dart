import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../home/presentation/manager/cups_of_water_cubit/water_tracking_cubit.dart';

import '../../../Community/presentation/views/community_view.dart';
import '../../../chatbot/presentation/views/chatbot_view.dart';
import '../../../home/data/repos/water_repo.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../meditations/presentation/views/meditations_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../widgets/main_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    BlocProvider(
      create: (context) =>
          WaterTrackingCubit(waterRepo: getIt.get<WaterRepo>())..loadData(),
      child: const HomeView(key: ValueKey('home')),
    ),
    const CommunityView(key: ValueKey('community')),
    const MeditationsView(key: ValueKey('meditations')),
    const ChatbotView(key: ValueKey('chatbot')),
    const ProfileView(key: ValueKey('profile')),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                return SlideTransition(position: offsetAnimation, child: child);
              },
              child: IndexedStack(
                key: ValueKey(_currentIndex),
                index: _currentIndex,
                children: _screens,
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
  }
}
