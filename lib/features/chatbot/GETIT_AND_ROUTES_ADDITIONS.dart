// ════════════════════════════════════════════════════════════════
// ADD THESE LINES to your existing setupGetIt() in get_it_service.dart
// ════════════════════════════════════════════════════════════════
//
// 1. Add the imports at the top of get_it_service.dart:
//
// import '../../features/chatbot/data/services/chatbot_api_service.dart';
// import '../../features/chatbot/data/services/chatbot_storage_service.dart';
// import '../../features/chatbot/data/repos/chatbot_repo.dart';
//
// 2. Add inside setupGetIt() body (anywhere after SupabaseCRUDService registration):

  /*// Chatbot API Service
  getIt.registerLazySingleton<ChatbotApiService>(
    () => ChatbotApiService(dio: getIt()),
  );

  // Chatbot Storage Service
  getIt.registerLazySingleton<ChatbotStorageService>(
    () => ChatbotStorageService(supabaseCRUDService: getIt()),
  );

  // Chatbot Repo
  getIt.registerLazySingleton<ChatbotRepo>(
    () => ChatbotRepo(
      apiService: getIt(),
      storageService: getIt(),
    ),
  );*/

// ════════════════════════════════════════════════════════════════
// ROUTES — add to your Routes class and router:
// ════════════════════════════════════════════════════════════════
//
// static const String chatSessionsView = '/chat-sessions';
// static const String chatbotView = '/chatbot';           // already exists
//
// In your GoRouter / AutoRoute, add:
//
// GoRoute(
//   path: Routes.chatSessionsView,
//   builder: (_, __) => BlocProvider(
//     create: (_) => ChatbotCubit(repo: getIt()),
//     child: ChatSessionsView(isPremium: getUser()!.isPremium),
//   ),
// ),
// GoRoute(
//   path: Routes.chatbotView,
//   builder: (_, state) => BlocProvider(
//     create: (_) => ChatbotCubit(repo: getIt()),
//     child: ChatbotView(sessionId: state.extra as String),
//   ),
// ),