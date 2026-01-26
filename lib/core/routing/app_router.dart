import 'package:flutter/material.dart';
import 'package:moodly/features/home/presentation/views/all_available_sessions_view.dart';
import 'package:moodly/features/home/presentation/views/all_meditations_view.dart';
import '../../features/chatbot/presentation/views/chatbot_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/profile/presentation/views/privacy_policy_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/profile/presentation/views/terms_and_conditions_view.dart';
import '../../features/payment/presentation/views/premium_view.dart';
import '../../features/payment/presentation/views/subscribe_view.dart';
import '../views/video_view.dart';
import '../../features/home/presentation/views/chat_doctor_view.dart';
import '../../features/home/presentation/views/live_view.dart';
import '../../features/home/presentation/views/recommendations_view.dart';
import '../../features/home/presentation/views/therapist_details_view.dart';
import '../../features/meditations/presentation/views/audio_view.dart';

import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/auth/presentation/views/start_view.dart';
import '../../features/auth/presentation/widgets/forgot_password/reset_password_screen.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/meditations/presentation/views/meditations_view.dart';
import '../../features/splash/views/splash_view.dart';
import 'routes.dart';

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

      case Routes.onboardingView:
        return MaterialPageRoute(builder: (_) => const OnboardingView());

      case Routes.mainView:
        return MaterialPageRoute(builder: (_) => const MainView());

      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.meditationsView:
        return MaterialPageRoute(builder: (_) => const MeditationsView());

      case Routes.chatbotView:
        return MaterialPageRoute(builder: (_) => const ChatbotView());

      case Routes.profileView:
        return MaterialPageRoute(builder: (_) => const ProfileView());

      case Routes.videoView:
        return MaterialPageRoute(builder: (_) => const VideoView());

      case Routes.audioView:
        return MaterialPageRoute(builder: (_) => const AudioView());

      case Routes.therapistDetailsView:
        return MaterialPageRoute(builder: (_) => const TherapistDetailsView());

      case Routes.chatDoctorView:
        return MaterialPageRoute(builder: (_) => const ChatDoctorView());

      case Routes.liveView:
        return MaterialPageRoute(builder: (_) => const LiveView());

      case Routes.recommendationsView:
        return MaterialPageRoute(builder: (_) => const RecommendationsView());

      case Routes.premiumView:
        return MaterialPageRoute(
          builder: (_) => const PremiumView(withClose: false),
        );

      case Routes.subscribeView:
        return MaterialPageRoute(builder: (_) => const SubscribeView());

      case Routes.termsAndConditionsView:
        return MaterialPageRoute(
          builder: (_) => const TermsAndConditionsView(),
        );

      case Routes.privacyPolicyView:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyView());

      case Routes.allMeditationsView:
        return MaterialPageRoute(builder: (_) => const AllMeditationsView());

      case Routes.allAvailableSessionsView:
        return MaterialPageRoute(
          builder: (_) => const AllAvailableSessionsView(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
