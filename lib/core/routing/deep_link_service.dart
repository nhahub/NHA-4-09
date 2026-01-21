import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/widgets.dart';
import 'deep_link_state.dart';
import 'navigation_service.dart';
import 'routes.dart';

class DeepLinkService {
  static final AppLinks _appLinks = AppLinks();
  static StreamSubscription<Uri>? _sub;

  static Future<void> init() async {
    // 🔹 initial link (app closed)
    final Uri? initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      _navigateSafely(initialUri);
    }

    // 🔹 runtime links
    _sub ??= _appLinks.uriLinkStream.listen(_navigateSafely);
  }

  static void _navigateSafely(Uri uri) {
    if (uri.host != 'reset-password') return;

    DeepLinkState.openedFromResetLink = true;

    // ❗❗❗ الحل السحري
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigatorKey.currentState?.pushNamed(Routes.resetPasswordView);
    });
  }

  static void dispose() {
    _sub?.cancel();
    _sub = null;
  }
}
