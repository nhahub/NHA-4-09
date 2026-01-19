import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/routing/deep_link_state.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/theming/app_assets.dart';
import '../../core/theming/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    if (DeepLinkState.openedFromResetLink) {
      DeepLinkState.openedFromResetLink = false;

      Navigator.pushReplacementNamed(context, Routes.resetPasswordView);
      return;
    }

    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      Navigator.pushReplacementNamed(context, Routes.homeView);
    } else {
      Navigator.pushReplacementNamed(context, Routes.startView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.lightGreen, AppColors.brandGreen],
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              AppAssets.zenspunLogo,
              width: 120,
              height: 120,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
