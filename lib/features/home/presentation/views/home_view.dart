import 'package:flutter/material.dart';
import 'package:moodly/core/networking/network_info.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../mood/presentation/helpers/mood_helper.dart';
import '../widgets/daily_stats_section/shared/home_view_body.dart';
import '../widgets/sessions_for_you_section/sessions_floating_action_button.dart';

class HomeView extends StatefulWidget {
  final bool isPremium;

  const HomeView({super.key, required this.isPremium});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    _checkConnection();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      openDailyMoodDialog(context);
    });
  }

  Future<void> _checkConnection() async {
    final connected = await NetworkMonitor().isConnected;

    if (mounted) {
      setState(() {
        isConnected = connected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: const SessionsFloatingActionButton(),
      appBar: CustomAppbar(title: "Home", isPremium: widget.isPremium),
      body: HomeViewBody(isPremium: widget.isPremium),
    );
  }
}
