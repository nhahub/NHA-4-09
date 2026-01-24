import 'package:flutter/material.dart';
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

      case Routes.mainView:
        return MaterialPageRoute(builder: (_) => const MainView());

      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.meditationsView:
        return MaterialPageRoute(builder: (_) => const MeditationsView());

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

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
