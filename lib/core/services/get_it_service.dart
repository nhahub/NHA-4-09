import 'package:get_it/get_it.dart';
import '../networking/supabase_service.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/home/data/repos/quote_repo_impl.dart';

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
