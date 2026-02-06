import 'package:get_it/get_it.dart';
import 'package:moodly/features/Community/data/services/audio_player_service.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/home/data/repos/quote_repo_impl.dart';
import '../../features/profile/data/repos/settings_repo.dart';
import 'supabase_auth_service.dart';
import 'supabase_crud_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // QuoteRepo
  getIt.registerLazySingleton<QuoteRepoImpl>(() => QuoteRepoImpl());

  // Supabase Auth Service
  getIt.registerLazySingleton<SupabaseAuthService>(() => SupabaseAuthService());

  // Supabase CRUD Service
  getIt.registerLazySingleton<SupabaseCRUDService>(() => SupabaseCRUDService());

  // AuthRepo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(supabaseAuthService: getIt()),
  );

  // SettingsRepo
  getIt.registerLazySingleton<SettingsRepo>(
    () => SettingsRepo(supabaseAuthService: getIt()),
  );

  // AudioPlayerService
  getIt.registerFactory(() => AudioPlayerService());
}
