import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/Community/presentation/views/add_community_post_view.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import '../../features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/manager/register_cubit/register_cubit.dart';
import '../../features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/auth/presentation/views/start_view.dart';
import '../../features/home/presentation/manager/cups_of_water_cubit/water_tracking_cubit.dart';
import '../../features/home/presentation/manager/get_booking_sessions_cubit/get_booking_sessions_cubit.dart';
import '../../features/home/presentation/views/all_booking_sessions_view.dart';
import '../../features/home/presentation/views/all_meditations_view.dart';
import '../../features/home/presentation/views/water_tracking_view.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/meals_recommendations/data/models/recommended_food_item_model.dart';
import '../../features/meals_recommendations/data/repos/recommended_food_repo.dart';
import '../../features/meals_recommendations/domain/enums/food_type.dart';
import '../../features/meals_recommendations/presentation/manager/recommended_food_cubit/recommended_food_cubit.dart';
import '../../features/meals_recommendations/presentation/views/recommended_food_details_view.dart';
import '../../features/meals_recommendations/presentation/views/recommended_food_view.dart';
import '../../features/meditations/data/models/audio_model.dart';
import '../../features/meditations/data/services/audio_player_service.dart';
import '../../features/meditations/presentation/manager/audio_player_cubit/audio_player_cubit.dart';
import '../../features/meditations/presentation/views/audio_view.dart';
import '../../features/meditations/presentation/views/video_view.dart';
import '../../features/mood/data/models/recommendation_model.dart';
import '../../features/mood/presentation/views/recommendations_view.dart';
import '../../features/onboarding/data/repos/questionnaire_repo.dart';
import '../../features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';
import '../../features/onboarding/presentation/manager/questionnaire_cubit/questionnaire_cubit.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/payment/data/repos/subscription_repo.dart';
import '../../features/payment/domain/repos/payment_repo.dart';
import '../../features/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import '../../features/payment/presentation/views/add_card_view.dart';
import '../../features/payment/presentation/views/premium_view.dart';
import '../../features/payment/presentation/views/subscribe_view.dart';
import '../../features/settings/data/repos/settings_repo.dart';
import '../../features/settings/presentation/views/about_view.dart';
import '../../features/settings/presentation/views/edit_profile_view.dart';
import '../../features/settings/presentation/views/privacy_policy_view.dart';
import '../../features/settings/presentation/views/subscription_management_view.dart';
import '../../features/settings/presentation/views/terms_and_conditions_view.dart';
import '../../features/therapist/data/models/booking_model.dart';
import '../../features/therapist/data/models/therapist_model.dart';
import '../../features/therapist/data/models/therapist_review_model.dart';
import '../../features/therapist/data/repos/availability_repo.dart';
import '../../features/therapist/data/repos/booking_repo.dart';
import '../../features/therapist/data/repos/chat_repo.dart';
import '../../features/therapist/data/repos/therapist_repo.dart';
import '../../features/therapist/data/repos/therapist_reviews_repo.dart';
import '../../features/therapist/presentation/manager/booking_cubit/booking_cubit.dart';
import '../../features/therapist/presentation/manager/chat_cubit/chat_cubit.dart';
import '../../features/therapist/presentation/manager/therapist_cubit/therapist_cubit.dart';
import '../../features/therapist/presentation/manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';
import '../../features/therapist/presentation/views/all_therapists_view.dart';
import '../../features/therapist/presentation/views/booking_session_view.dart';
import '../../features/therapist/presentation/views/therapist_chat_view.dart';
import '../../features/therapist/presentation/views/therapist_details_view.dart';
import '../../features/therapist/presentation/views/therapist_live_view.dart';
import '../../features/therapist/presentation/views/therapist_review_add_view.dart';
import '../../features/therapist/presentation/views/therapist_review_update_view.dart';
import '../../features/therapist/presentation/views/therapist_reviews_view.dart';
import '../services/app_launch_decider.dart';
import '../services/get_it_service.dart';
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
        return MaterialPageRoute(builder: (context) => const MainView());

      case Routes.waterTrackingView:
        final cubit = settings.arguments as WaterTrackingCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: const WaterTrackingView(),
          ),
        );

      case Routes.recommendedFoodView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RecommendedFoodCubit(
              recommendedFoodRepo: getIt.get<RecommendedFoodRepo>(),
            )..getRecommendedFood(foodType: FoodType.meals),
            child: const RecommendedFoodView(),
          ),
        );

      case Routes.recommendedFoodDetailsView:
        final RecommendedFoodItemModel recommendedFoodItemModel =
            settings.arguments as RecommendedFoodItemModel;
        return MaterialPageRoute(
          builder: (context) => RecommendedFoodDetailsView(
            recommendedFoodItemModel: recommendedFoodItemModel,
          ),
        );

      case Routes.addCommunityPostView:
        return MaterialPageRoute(
          builder: (context) => const AddCommunityPostView(),
        );

      case Routes.videoView:
        return MaterialPageRoute(builder: (context) => const VideoView());

      case Routes.addCardView:
        return MaterialPageRoute(builder: (context) => const AddCardView());

      case Routes.audioView:
        final AudioModel audioModel = settings.arguments as AudioModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AudioPlayerCubit(
              audioPlayerService: getIt.get<AudioPlayerService>(),
              audioModel: audioModel,
            )..initAudio(audioUrl: audioModel.audioUrl),
            child: const AudioView(),
          ),
        );

      case Routes.therapistChatView:
        final String therapistId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                ChatCubit(chatRepo: getIt.get<ChatRepo>())
                  ..loadMessages(therapistId: therapistId),
            child: const TherapistChatView(),
          ),
        );

      case Routes.therapistLiveView:
        final String callID = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => TherapistLiveView(callID: callID),
        );

      case Routes.therapistDetailsView:
        final TherapistModel therapistModel =
            settings.arguments as TherapistModel;
        return MaterialPageRoute(
          builder: (context) =>
              TherapistDetailsView(therapistModel: therapistModel),
        );

      case Routes.therapistRatingsView:
        final String therapistId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => TherapistReviewsCubit(
              therapistRatingRepo: getIt.get<TherapistReviewsRepo>(),
            )..getReviews(therapistId: therapistId),
            child: TherapistReviewsView(therapistId: therapistId),
          ),
        );

      case Routes.therapistRatingAddView:
        final args = settings.arguments as Map<String, dynamic>;
        final String therapistId = args['therapistId'];
        final TherapistReviewsCubit cubit = args['cubit'];
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: cubit,
              child: TherapistReviewAddView(therapistId: therapistId),
            );
          },
        );

      case Routes.therapistRatingUpdateView:
        final args = settings.arguments as Map<String, dynamic>;
        final String therapistId = args['therapistId'];
        final TherapistReviewModel oldTherapistReviewMode =
            args['oldTherapistReviewModel'] as TherapistReviewModel;
        final TherapistReviewsCubit cubit = args['cubit'];
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: cubit,
              child: TherapistReviewUpdateView(
                therapistId: therapistId,
                oldTherapistReviewModel: oldTherapistReviewMode,
              ),
            );
          },
        );

      case Routes.recommendationsView:
        final recommendationModel = settings.arguments as RecommendationModel;
        return MaterialPageRoute(
          builder: (context) =>
              RecommendationsView(recommendationModel: recommendationModel),
        );

      case Routes.premiumView:
        final bool withClose = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (context) => PremiumView(withClose: withClose),
        );

      case Routes.subscribeView:
        final args = settings.arguments as Map<String, dynamic>;
        final double price = args['price'] as double;
        final String? type = args['type'] as String?;
        final String? sessionType = args['sessionType'] as String?;
        final BookingSlot? slot = args['slot'] as BookingSlot?;
        final BookingTherapist? therapist =
            args['therapist'] as BookingTherapist?;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PaymentCubit(
              paymentRepo: getIt.get<PaymentRepo>(),
              subscriptionRepo: getIt.get<SubscriptionRepo>(),
              bookingRepo: getIt.get<BookingRepo>(),
              price: price,
              type: type,
              sessionType: sessionType,
              slot: slot,
              therapist: therapist,
            )..loadSavedCards(),
            child: const SubscribeView(),
          ),
        );

      case Routes.bookingSessionView:
        final args = settings.arguments as Map<String, dynamic>;
        final TherapistModel therapistModel =
            args['therapist'] as TherapistModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => BookingCubit(
              therapist: therapistModel,
              availabilityRepo: getIt.get<AvailabilityRepo>(),
            )..getAvailableSlots(),
            child: BookingSessionView(therapist: therapistModel),
          ),
        );

      case Routes.allBookingSessionsView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                GetBookingSessionsCubit(bookingRepo: getIt.get<BookingRepo>())
                  ..getBookingSessions(),
            child: const AllBookingSessionsView(),
          ),
        );

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

      case Routes.editProfileView:
        return MaterialPageRoute(builder: (context) => const EditProfileView());

      case Routes.subscriptionManagementView:
        return MaterialPageRoute(
          builder: (context) => const SubscriptionManagementView(),
        );

      case Routes.aboutView:
        return MaterialPageRoute(builder: (context) => const AboutView());

      case Routes.allAvailableSessionsView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                TherapistCubit(therapistRepo: getIt.get<TherapistRepo>())
                  ..getTherapists(),
            child: const AllTherapistsView(),
          ),
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
