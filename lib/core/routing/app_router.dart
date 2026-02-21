import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/presentation/manager/cups_of_water_cubit/water_tracking_cubit.dart';
import '../../features/home/presentation/views/water_tracking_view.dart';
import '../../features/meals_recommendations/presentation/views/meals_recommendations_view.dart';
import '../../features/Community/data/services/audio_player_service.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import '../../features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/manager/logout_cubit/logout_cubit.dart';
import '../../features/auth/presentation/manager/register_cubit/register_cubit.dart';
import '../../features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/auth/presentation/views/start_view.dart';
import '../../features/chatbot/presentation/views/chatbot_view.dart';
import '../../features/home/presentation/views/all_available_sessions_view.dart';
import '../../features/home/presentation/views/all_meditations_view.dart';
import '../../features/home/presentation/views/chat_doctor_view.dart';
import '../../features/home/presentation/views/live_view.dart';
import '../../features/home/presentation/views/recommendations_view.dart';
import '../../features/home/presentation/views/therapist_details_view.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/meditations/domain/audio_entity.dart';
import '../../features/meditations/presentation/manager/cubit/audio_cubit.dart';
import '../../features/meditations/presentation/views/audio_view.dart';
import '../../features/meditations/presentation/views/meditations_view.dart';
import '../../features/onboarding/data/repos/questionnaire_repo.dart';
import '../../features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';
import '../../features/onboarding/presentation/manager/questionnaire_cubit/questionnaire_cubit.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/payment/presentation/views/premium_view.dart';
import '../../features/payment/presentation/views/subscribe_view.dart';
import '../../features/profile/data/repos/settings_repo.dart';
import '../../features/profile/presentation/views/privacy_policy_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/profile/presentation/views/terms_and_conditions_view.dart';
import '../services/app_launch_decider.dart';
import '../services/get_it_service.dart';
import '../views/video_view.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';

    if (routeName.contains('callback')) {
      return MaterialPageRoute(
        builder: (_) => AppLaunchDecider.decideStartView(),
      );
    }

    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (_) => AppLaunchDecider.decideStartView(),
        );

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
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => OnboardingCubit()),
              BlocProvider(
                create: (context) => QuestionnaireCubit(
                  questionnaireRepo: getIt.get<QuestionnaireRepo>(),
                ),
              ),
            ],
            child: const OnboardingView(),
          ),
        );

      case Routes.mainView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                LogoutCubit(settingsRepo: getIt.get<SettingsRepo>()),
            child: const MainView(),
          ),
        );

      case Routes.waterTrackingView:
        final cubit = settings.arguments as WaterTrackingCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: const WaterTrackingView(),
          ),
        );

      case Routes.mealsRecommendationsView:
        return MaterialPageRoute(
          builder: (context) => const MealsRecommendationsView(),
        );

      case Routes.meditationsView:
        return MaterialPageRoute(builder: (context) => const MeditationsView());

      case Routes.chatbotView:
        return MaterialPageRoute(builder: (context) => const ChatbotView());

      case Routes.profileView:
        return MaterialPageRoute(builder: (context) => const ProfileView());

      case Routes.videoView:
        return MaterialPageRoute(builder: (context) => const VideoView());

      case Routes.audioView:
        final AudioEntity audioEntity = settings.arguments as AudioEntity;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AudioCubit(
              audioService: getIt.get<AudioPlayerService>(),
              audioEntity: audioEntity,
            )..initAudio(audioUrl: audioEntity.audioUrl),
            child: const AudioView(),
          ),
        );

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
        final bool withClose = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (context) => PremiumView(withClose: withClose),
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
