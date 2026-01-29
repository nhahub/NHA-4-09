import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/profile/data/repos/settings_repo.dart';
import '../services/get_it_service.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import '../../features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/manager/logout_cubit/logout_cubit.dart';
import '../../features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import '../../features/home/presentation/views/all_available_sessions_view.dart';
import '../../features/home/presentation/views/all_meditations_view.dart';
import '../../features/auth/presentation/manager/register_cubit/register_cubit.dart';
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
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/meditations/presentation/views/meditations_view.dart';
import '../../features/splash/views/splash_view.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case Routes.startView:
        return MaterialPageRoute(builder: (context) => const StartView());

      case Routes.loginView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(authRepo: getIt.get<AuthRepo>()),
            child: const LoginView(),
          ),
        );

      case Routes.registerView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(authRepo: getIt.get<AuthRepo>()),
            child: const RegisterView(),
          ),
        );

      case Routes.forgotPasswordView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                ForgotPasswordCubit(authRepo: getIt.get<AuthRepo>()),
            child: const ForgotPasswordView(),
          ),
        );

      case Routes.resetPasswordView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                ResetPasswordCubit(settingsRepo: getIt.get<SettingsRepo>()),
            child: const ResetPasswordView(),
          ),
        );

      case Routes.onboardingView:
        return MaterialPageRoute(builder: (context) => const OnboardingView());

      case Routes.mainView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                LogoutCubit(settingsRepo: getIt.get<SettingsRepo>()),
            child: const MainView(),
          ),
        );

      case Routes.homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());

      case Routes.meditationsView:
        return MaterialPageRoute(builder: (context) => const MeditationsView());

      case Routes.chatbotView:
        return MaterialPageRoute(builder: (context) => const ChatbotView());

      case Routes.profileView:
        return MaterialPageRoute(builder: (context) => const ProfileView());

      case Routes.videoView:
        return MaterialPageRoute(builder: (context) => const VideoView());

      case Routes.audioView:
        return MaterialPageRoute(builder: (context) => const AudioView());

      case Routes.therapistDetailsView:
        return MaterialPageRoute(
          builder: (context) => const TherapistDetailsView(),
        );

      case Routes.chatDoctorView:
        return MaterialPageRoute(builder: (context) => const ChatDoctorView());

      case Routes.liveView:
        return MaterialPageRoute(builder: (context) => const LiveView());

      case Routes.recommendationsView:
        return MaterialPageRoute(
          builder: (context) => const RecommendationsView(),
        );

      case Routes.premiumView:
        return MaterialPageRoute(
          builder: (context) => const PremiumView(withClose: false),
        );

      case Routes.subscribeView:
        return MaterialPageRoute(builder: (context) => const SubscribeView());

      case Routes.termsAndConditionsView:
        return MaterialPageRoute(
          builder: (context) => const TermsAndConditionsView(),
        );

      case Routes.privacyPolicyView:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicyView(),
        );

      case Routes.allMeditationsView:
        return MaterialPageRoute(
          builder: (context) => const AllMeditationsView(),
        );

      case Routes.allAvailableSessionsView:
        return MaterialPageRoute(
          builder: (context) => const AllAvailableSessionsView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
