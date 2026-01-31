import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/routing/deep_link_state.dart';
import '../../../core/routing/routes.dart';
import '../widgets/splash_view_body.dart';

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
      context.pushAndRemoveUntil(Routes.resetPasswordView);
      return;
    }
    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      context.pushReplacement(Routes.mainView);
    } else {
      context.pushReplacement(Routes.startView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(body: SplashViewBody()),
    );
  }
}
