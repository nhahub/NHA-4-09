import 'package:flutter/material.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/features/auth/presentation/views/forgot_password_view.dart';
import 'package:moodly/features/auth/presentation/views/login_view.dart';
import 'package:moodly/features/auth/presentation/views/register_view.dart';
import 'package:moodly/features/auth/presentation/views/start_view.dart';
import 'package:moodly/features/auth/presentation/widgets/forgot_password/reset_password_screen.dart';
import 'package:moodly/features/home/presentation/views/home_view.dart';
import 'package:moodly/features/meditations/presentation/views/meditations_view.dart';
import 'package:moodly/features/splash/splash_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.startView:
        return MaterialPageRoute(builder: (_) => const StartView());

      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case Routes.registerView:
        return MaterialPageRoute(builder: (_) => const RegisterView());

      case Routes.forgotPasswordView:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());

      case Routes.resetPasswordView:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.meditationsView:
        return MaterialPageRoute(builder: (_) => const MeditationsView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
