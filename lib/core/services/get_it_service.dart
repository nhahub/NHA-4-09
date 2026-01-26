import 'package:get_it/get_it.dart';
import 'package:moodly/features/home/data/repos/quote_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // QuoteRepo
  getIt.registerLazySingleton<QuoteRepoImpl>(() => QuoteRepoImpl());
}
