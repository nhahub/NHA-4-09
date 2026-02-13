import 'package:get_it/get_it.dart';

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

  // Qestionnaire
  getIt.registerLazySingleton<QuestionnaireService>(
    () => QuestionnaireService(
      supabaseService: getIt(),
      supabaseAuthService: getIt(),
    ),
  );
  
  getIt.registerLazySingleton<QuestionnaireRepo>(
    () => QuestionnaireRepo(questionnaireService: getIt()),
  );

  // QuoteRepo
  getIt.registerLazySingleton<QuoteRepoImpl>(() => QuoteRepoImpl());

  // Supabase Auth Service
  getIt.registerLazySingleton<SupabaseAuthService>(() => SupabaseAuthService());

  // AuthRepo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(supabaseAuthService: getIt(), supabaseCRUDService: getIt()),
  );

  // SettingsRepo
  getIt.registerLazySingleton<SettingsRepo>(
    () => SettingsRepo(supabaseAuthService: getIt()),
  );

  // AudioPlayerService
  getIt.registerFactory(() => AudioPlayerService());
}
