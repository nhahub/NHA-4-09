import 'package:get_it/get_it.dart';
import 'package:moodly/core/networking/supabase_service.dart';
import 'package:moodly/features/auth/data/repos/auth_repo.dart';
import 'package:moodly/features/home/data/repos/quote_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // QuoteRepo
  getIt.registerLazySingleton<QuoteRepoImpl>(() => QuoteRepoImpl());

  // Supabase Service
  getIt.registerLazySingleton<SupabaseService>(() => SupabaseService());

  // AuthRepo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(supabaseService: getIt()),
  );
}
