import 'package:go_router/go_router.dart';

import '../../features/app/privacy_policy_view.dart';
import '../../features/app/terms_and_conditions_view.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/auth/presentation/views/start_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/meditations/presentation/views/meditations_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/payment/presentation/views/premium_view.dart';
import '../../features/payment/presentation/views/subscribe_view.dart';
import '../../features/splash/splash_view.dart';
import 'routes.dart';

abstract class AppRouter {
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: Routes.meditationsView,
      routes: [
        GoRoute(
          path: Routes.splashView,
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(
          path: Routes.startView,
          builder: (context, state) => const StartView(),
        ),
        GoRoute(
          path: Routes.loginView,
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: Routes.registerView,
          builder: (context, state) => const RegisterView(),
        ),
        GoRoute(
          path: Routes.forgotPasswordView,
          builder: (context, state) => const ForgotPasswordView(),
        ),
        GoRoute(
          path: Routes.onboardingView,
          builder: (context, state) => const OnboardingView(),
        ),
        GoRoute(
          path: Routes.premiumView,
          builder: (context, state) => const PremiumView(withClose: false),
        ),
        GoRoute(
          path: Routes.subscribeView,
          builder: (context, state) => const SubscribeView(),
        ),
        GoRoute(
          path: Routes.homeView,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: Routes.meditationsView,
          builder: (context, state) => const MeditationsView(),
        ),
        GoRoute(
          path: Routes.termsAndConditionsView,
          builder: (context, state) => const TermsAndConditionsView(),
        ),
        GoRoute(
          path: Routes.privacyPolicyView,
          builder: (context, state) => const PrivacyPolicyView(),
        ),
      ],
    );
  }
}
