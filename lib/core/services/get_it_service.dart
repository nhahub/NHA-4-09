import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:moodly/features/meditations/data/repos/podcast_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/data/repos/user_data_repo.dart';
import '../../features/auth/data/services/supabase_auth_service.dart';
import '../../features/auth/data/services/user_data_service.dart';
import '../../features/home/data/repos/activities_repo.dart';
import '../../features/home/data/repos/quote_repo.dart';
import '../../features/home/data/repos/water_repo.dart';
import '../../features/home/data/services/activities_remote_service.dart';
import '../../features/home/data/services/quotes_local_service.dart';
import '../../features/home/data/services/water_local_service.dart';
import '../../features/meals_recommendations/data/local_service/recommended_food_local_service.dart';
import '../../features/meals_recommendations/data/repos/recommended_food_repo.dart';
import '../../features/meditations/data/models/article_model.dart';
import '../../features/meditations/data/models/book_model.dart';
import '../../features/meditations/data/models/video_model.dart';
import '../../features/meditations/data/repos/asmr_repo.dart';
import '../../features/meditations/data/repos/recommended_articles_repo.dart';
import '../../features/meditations/data/repos/recommended_books_repo.dart';
import '../../features/meditations/data/repos/recommended_videos_repo.dart';
import '../../features/meditations/data/services/audio_player_service.dart';
import '../../features/meditations/data/services/asmr_service.dart';
import '../../features/meditations/data/services/podcast_service.dart';
import '../../features/meditations/data/services/recommended_articles_local_service.dart';
import '../../features/meditations/data/services/recommended_articles_remote_service.dart';
import '../../features/meditations/data/services/recommended_books_local_service.dart';
import '../../features/meditations/data/services/recommended_books_remote_service.dart';
import '../../features/meditations/data/services/recommended_videos_local_service.dart';
import '../../features/meditations/data/services/recommended_videos_remote_service.dart';
import '../../features/mood/data/repos/mood_progress_repo.dart';
import '../../features/mood/data/repos/mood_repo.dart';
import '../../features/mood/data/repos/recommendation_repo.dart';
import '../../features/mood/data/services/mood_local_service.dart';
import '../../features/mood/data/services/mood_progress_service.dart';
import '../../features/mood/data/services/mood_remote_service.dart';
import '../../features/mood/data/services/recommendation_local_service.dart';
import '../../features/onboarding/data/Services/questionnaire_service.dart';
import '../../features/onboarding/data/repos/questionnaire_repo.dart';
import '../../features/payment/data/repos/payment_repo_imp.dart';
import '../../features/payment/data/repos/subscription_repo.dart';
import '../../features/payment/data/services/api_service.dart';
import '../../features/payment/data/services/cards_local_service.dart';
import '../../features/payment/data/services/paymob_service.dart';
import '../../features/payment/data/services/stripe_service.dart';
import '../../features/payment/data/services/subscription_local_service.dart';
import '../../features/payment/data/services/subscription_remote_service.dart';
import '../../features/payment/domain/repos/payment_repo.dart';
import '../../features/settings/data/repos/app_rating_repo.dart';
import '../../features/settings/data/repos/privacy_policy_repo.dart';
import '../../features/settings/data/repos/settings_repo.dart';
import '../../features/settings/data/repos/terms_repo.dart';
import '../../features/settings/data/repos/update_profile_repo.dart';
import '../../features/settings/data/services/app_rating_local_service.dart';
import '../../features/settings/data/services/app_rating_service.dart';
import '../../features/settings/data/services/privacy_policy_local_service.dart';
import '../../features/settings/data/services/terms_local_service.dart';
import '../../features/therapist/data/repos/availability_repo.dart';
import '../../features/therapist/data/repos/booking_repo.dart';
import '../../features/therapist/data/repos/chat_repo.dart';
import '../../features/therapist/data/repos/therapist_repo.dart';
import '../../features/therapist/data/repos/therapist_reviews_repo.dart';
import '../../features/therapist/data/services/availability_service.dart';
import '../../features/therapist/data/services/booking_service.dart';
import '../../features/therapist/data/services/chat_service.dart';
import '../../features/therapist/data/services/therapist_reviews_service.dart';
import '../../features/therapist/data/services/therapist_service.dart';
import 'local_cache_service.dart';
import 'supabase_crud_service.dart';
import 'supabase_storage_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Supabase
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  getIt.registerLazySingleton<Dio>(() => Dio());

  // ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));

  // Supabase Storage Service
  getIt.registerLazySingleton<SupabaseStorageService>(
    () => SupabaseStorageService(client: getIt()),
  );

  // Stripe Service
  getIt.registerLazySingleton<StripeService>(
    () => StripeService(apiService: getIt()),
  );
  // Paymob Service
  getIt.registerLazySingleton<PaymobService>(() => PaymobService());

  // Cards Local Service
  getIt.registerLazySingleton<CardsLocalService>(() => CardsLocalService());

  // Subscription Remote Service
  getIt.registerLazySingleton<SubscriptionRemoteService>(
    () => SubscriptionRemoteService(supabaseCRUDService: getIt()),
  );

  // Subscription Local Service
  getIt.registerLazySingleton<SubscriptionLocalService>(
    () => SubscriptionLocalService(),
  );

  // Subscription Repo
  getIt.registerLazySingleton<SubscriptionRepo>(
    () => SubscriptionRepo(local: getIt(), remote: getIt()),
  );

  // CheckoutRepo
  getIt.registerLazySingleton<PaymentRepo>(
    () => PaymentRepoImp(
      stripeService: getIt(),
      paymobService: getIt(),
      local: getIt(),
    ),
  );
  // Supabase CRUD Service
  getIt.registerLazySingleton<SupabaseCRUDService>(
    () => SupabaseCRUDService(client: getIt()),
  );

  // Questionnaire Service
  getIt.registerLazySingleton<QuestionnaireService>(
    () => QuestionnaireService(supabaseService: getIt()),
  );

  getIt.registerLazySingleton<QuestionnaireRepo>(
    () => QuestionnaireRepo(questionnaireService: getIt()),
  );

  // Quote Local Service
  getIt.registerLazySingleton<QuotesLocalService>(() => QuotesLocalService());

  // Quote Repo
  getIt.registerLazySingleton<QuoteRepo>(
    () => QuoteRepo(quotesLocalService: getIt()),
  );

  // Water Repo
  getIt.registerLazySingleton<WaterLocalService>(() => WaterLocalService());

  // Water Repo
  getIt.registerLazySingleton<WaterRepo>(
    () => WaterRepo(waterLocalService: getIt()),
  );

  // Supabase Auth Service
  getIt.registerLazySingleton<SupabaseAuthService>(
    () => SupabaseAuthService(supabase: getIt()),
  );

  // Auth Repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(supabaseAuthService: getIt(), userDataRepo: getIt()),
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
    () => RecommendedFoodRepo(localService: getIt(), moodLocalService: getIt()),
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

  // Mood Progress Service
  getIt.registerLazySingleton<MoodProgressService>(
    () => MoodProgressService(supabase: getIt()),
  );

  // Mood Progress Repo
  getIt.registerLazySingleton<MoodProgressRepo>(
    () => MoodProgressRepo(moodProgressService: getIt()),
  );

  // Recommendation Local Service
  getIt.registerLazySingleton<RecommendationLocalService>(
    () => RecommendationLocalService(),
  );
  // Recommendation Repo
  getIt.registerLazySingleton<RecommendationRepo>(
    () => RecommendationRepo(
      recommendationLocalService: getIt(),
      moodLocalService: getIt(),
    ),
  );

  // Availability Service
  getIt.registerLazySingleton<AvailabilityService>(
    () => AvailabilityService(supabaseCRUDService: getIt()),
  );

  // Availability Repo
  getIt.registerLazySingleton<AvailabilityRepo>(
    () => AvailabilityRepo(availabilityService: getIt()),
  );

  // Booking Service
  getIt.registerLazySingleton<BookingService>(
    () => BookingService(supabaseCRUDService: getIt()),
  );

  // Booking Repo
  getIt.registerLazySingleton<BookingRepo>(
    () => BookingRepo(bookingService: getIt()),
  );

  // Chat Repo
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(chatService: getIt()));

  // ASMR Service
  getIt.registerLazySingleton<AsmrService>(
    () => AsmrService(supabaseCRUDService: getIt()),
  );

  // ASMR Repo
  getIt.registerLazySingleton<AsmrRepo>(() => AsmrRepo(asmrService: getIt()));

  // Podcast Service
  getIt.registerLazySingleton<PodcastService>(
    () => PodcastService(supabaseCRUDService: getIt()),
  );

  // Podcast Repo
  getIt.registerLazySingleton<PodcastRepo>(
    () => PodcastRepo(podcastService: getIt()),
  );

  // App Rating Service
  getIt.registerLazySingleton<AppRatingService>(
    () => AppRatingService(supabaseCRUDService: getIt()),
  );

  // App Rating Local Service
  getIt.registerLazySingleton<AppRatingLocalService>(
    () => AppRatingLocalService(),
  );

  // Terms Repo
  getIt.registerLazySingleton<TermsRepo>(
    () => TermsRepo(termsLocalService: getIt()),
  );

  // Privacy Policy Local Service
  getIt.registerLazySingleton<PrivacyPolicyLocalService>(
    () => PrivacyPolicyLocalService(),
  );

  // Privacy Policy Repo
  getIt.registerLazySingleton<PrivacyPolicyRepo>(
    () => PrivacyPolicyRepo(privacyPolicyLocalService: getIt()),
  );

  // Terms Local Service
  getIt.registerLazySingleton<TermsLocalService>(() => TermsLocalService());

  // User Data Service
  getIt.registerLazySingleton<UserDataService>(
    () => UserDataService(supabaseCRUDService: getIt()),
  );

  // User Data Repo
  getIt.registerLazySingleton<UserDataRepo>(
    () => UserDataRepo(userDataService: getIt()),
  );

  // App Rating Repo
  getIt.registerLazySingleton<AppRatingRepo>(
    () => AppRatingRepo(
      appRatingService: getIt(),
      appRatingLocalService: getIt(),
    ),
  );

  // Local Cache
  getIt.registerLazySingleton<LocalCacheService<BookModel>>(
    () => LocalCacheService<BookModel>(),
  );
  // Local Cache
  getIt.registerLazySingleton<LocalCacheService<ArticleModel>>(
    () => LocalCacheService<ArticleModel>(),
  );

  // Recommended Books Local Service
  getIt.registerLazySingleton<RecommendedBooksLocalService>(
    () => RecommendedBooksLocalService(localCacheService: getIt()),
  );

  // Recommended Books Remote Service
  getIt.registerLazySingleton<RecommendedBooksRemoteService>(
    () => RecommendedBooksRemoteService(getIt()),
  );

  // Activities Remote Service
  getIt.registerLazySingleton<ActivitiesRemoteService>(
    () => ActivitiesRemoteService(supabaseCRUDService: getIt()),
  );

  // Activities Repo
  getIt.registerLazySingleton<ActivitiesRepo>(
    () => ActivitiesRepo(activitiesRemoteService: getIt()),
  );

  // Mood Local Service
  getIt.registerLazySingleton<MoodLocalService>(() => MoodLocalService());

  // Recommended Books Repo
  getIt.registerLazySingleton<RecommendedBooksRepo>(
    () => RecommendedBooksRepo(
      recommendedBooksLocalService: getIt(),
      recommendedBooksRemoteService: getIt(),
      moodLocalService: getIt(),
    ),
  );

  // Recommended Articles Remote Service
  getIt.registerLazySingleton<RecommendedArticlesRemoteService>(
    () => RecommendedArticlesRemoteService(supabaseCRUDService: getIt()),
  );

  // Recommended Articles Local Service
  getIt.registerLazySingleton<RecommendedArticlesLocalService>(
    () => RecommendedArticlesLocalService(localCacheService: getIt()),
  );

  // Recommended Articles Repo
  getIt.registerLazySingleton<RecommendedArticlesRepo>(
    () => RecommendedArticlesRepo(
      recommendedArticlesRemoteService: getIt(),
      recommendedArticlesLocalService: getIt(),
      moodLocalService: getIt(),
    ),
  );

  // Recommended Videos Remote Service
  getIt.registerLazySingleton<RecommendedVideosRemoteService>(
    () => RecommendedVideosRemoteService(supabaseCRUDService: getIt()),
  );

  // Local Cache Service Video Model
  getIt.registerLazySingleton<LocalCacheService<VideoModel>>(
    () => LocalCacheService<VideoModel>(),
  );

  // Recommended Videos Local Service
  getIt.registerLazySingleton<RecommendedVideosLocalService>(
    () => RecommendedVideosLocalService(localCacheService: getIt()),
  );

  // Recommended Videos Repo
  getIt.registerLazySingleton<RecommendedVideosRepo>(
    () => RecommendedVideosRepo(
      recommendedVideosRemoteService: getIt(),
      recommendedVideosLocalService: getIt(),
      moodLocalService: getIt(),
    ),
  );

  // Update Profile Repo
  getIt.registerLazySingleton<UpdateProfileRepo>(
    () => UpdateProfileRepo(
      userDataService: getIt(),
      supabaseStorageService: getIt(),
      supabaseCRUDService: getIt(),
    ),
  );

  // Audio Player
  getIt.registerFactory<AudioPlayer>(() => AudioPlayer());

  // Audio Player Service
  getIt.registerFactory(() => AudioPlayerService(player: getIt()));
}
