import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moodly/features/payment/data/repos/checkout_repo.dart';
import 'package:moodly/features/payment/data/services/stripe_service.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/home/data/repos/quote_repo_impl.dart';
import '../../features/home/data/repos/water_repo.dart';
import '../../features/meals_recommendations/data/local_service/recommended_food_local_service.dart';
import '../../features/meals_recommendations/data/repos/recommended_food_repo.dart';
import '../../features/meditations/data/services/audio_player_service.dart';
import '../../features/mood/data/repos/mood_repo.dart';
import '../../features/mood/data/services/mood_remote_service.dart';
import '../../features/onboarding/data/Services/questionnaire_service.dart';
import '../../features/onboarding/data/repos/questionnaire_repo.dart';
import '../../features/payment/data/repos/checkout_repo_imp.dart';
import '../../features/payment/data/services/api_service.dart';
import '../../features/profile/data/repos/settings_repo.dart';
import '../../features/therapist/data/repos/chat_repo.dart';
import '../../features/therapist/data/repos/therapist_repo.dart';
import '../../features/therapist/data/repos/therapist_reviews_repo.dart';
import '../../features/therapist/data/services/chat_service.dart';
import '../../features/therapist/data/services/therapist_reviews_service.dart';
import '../../features/therapist/data/services/therapist_service.dart';
import 'supabase_auth_service.dart';
import 'supabase_crud_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  // StripeService
  getIt.registerLazySingleton<StripeService>(
    () => StripeService(apiService: getIt()),
  );

  // CheckoutRepo
  getIt.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepoImp(stripeService: getIt()),
  );
  // Supabase CRUD Service
  getIt.registerLazySingleton<SupabaseCRUDService>(() => SupabaseCRUDService());

  // Questionnaire Service
  getIt.registerLazySingleton<QuestionnaireService>(
    () => QuestionnaireService(
      supabaseService: getIt(),
      supabaseAuthService: getIt(),
    ),
  );

  getIt.registerLazySingleton<QuestionnaireRepo>(
    () => QuestionnaireRepo(questionnaireService: getIt()),
  );

  // Quote Repo
  getIt.registerLazySingleton<QuoteRepoImpl>(() => QuoteRepoImpl());

  // Water Repo
  getIt.registerLazySingleton<WaterRepo>(() => WaterRepo());

  // Supabase Auth Service
  getIt.registerLazySingleton<SupabaseAuthService>(() => SupabaseAuthService());

  // Auth Repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(supabaseAuthService: getIt()),
  );

  // Mood Repo
  getIt.registerLazySingleton<MoodRepo>(
    () => MoodRepo(moodRemoteService: getIt()),
  );

  // Mood Remote Service
  getIt.registerLazySingleton<MoodRemoteService>(
    () => MoodRemoteService(supabaseService: getIt()),
  );

  // Settings Repo
  getIt.registerLazySingleton<SettingsRepo>(
    () => SettingsRepo(supabaseAuthService: getIt()),
  );

  // Mood Local Data Source
  getIt.registerLazySingleton<RecommendedFoodLocalService>(
    () => RecommendedFoodLocalService(),
  );

  // Recommended Food Repo
  getIt.registerLazySingleton<RecommendedFoodRepo>(
    () => RecommendedFoodRepo(localService: getIt()),
  );

  // Chat Repo
  getIt.registerLazySingleton<ChatService>(
    () => ChatService(supabaseCRUDService: getIt()),
  );

  // Therapist Rating Repo
  getIt.registerLazySingleton<TherapistReviewsRepo>(
    () => TherapistReviewsRepo(therapistReviewsService: getIt()),
  );

  // Therapist Rating Service
  getIt.registerLazySingleton<TherapistReviewsService>(
    () => TherapistReviewsService(supabaseCRUDService: getIt()),
  );

  // Therapist Rating Service
  getIt.registerLazySingleton<TherapistService>(
    () => TherapistService(supabaseCRUDService: getIt()),
  );

  // Therapist Rating Service
  getIt.registerLazySingleton<TherapistRepo>(
    () => TherapistRepo(therapistService: getIt()),
  );

  // Chat Repo
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(chatService: getIt()));

  // Audio Player Service
  getIt.registerFactory(() => AudioPlayerService());
}
