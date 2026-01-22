import 'package:flutter/material.dart';
import '../../../Community/presentation/views/community_view.dart';
import '../../../chatbot/presentation/views/chatbot_view.dart';
import '../../../home/presentation/views/home_view.dart';
import '../widgets/main_nav_bar.dart';
import '../../../meditations/presentation/views/meditations_view.dart';
import '../../../profile/presentation/views/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeView(key: ValueKey('home')),
    CommunityView(key: ValueKey('community')),
    MeditationsView(key: ValueKey('meditations')),
    ChatbotView(key: ValueKey('chatbot')),
    ProfileView(key: ValueKey('profile')),
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
