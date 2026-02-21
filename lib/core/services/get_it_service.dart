import 'package:get_it/get_it.dart';
import '../../features/home/data/repos/water_repo.dart';
import '../../features/mood/data/repos/mood_repo.dart';
import '../../features/mood/data/services/mood_remote_service.dart';

import '../../features/Community/data/services/audio_player_service.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/home/data/repos/quote_repo_impl.dart';
import '../../features/onboarding/data/Services/questionnaire_service.dart';
import '../../features/onboarding/data/repos/questionnaire_repo.dart';
import '../../features/profile/data/repos/settings_repo.dart';
import 'supabase_auth_service.dart';
import 'supabase_crud_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
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

  // Audio Player Service
  getIt.registerFactory(() => AudioPlayerService());
}
