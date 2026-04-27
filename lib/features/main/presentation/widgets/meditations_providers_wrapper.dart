import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/meditations/data/repos/podcast_repo.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../meditations/data/repos/asmr_repo.dart';
import '../../../meditations/data/repos/recommended_articles_repo.dart';
import '../../../meditations/data/repos/recommended_books_repo.dart';
import '../../../meditations/data/repos/recommended_videos_repo.dart';
import '../../../meditations/presentation/manager/asmr_cubit/asmr_cubit.dart';
import '../../../meditations/presentation/manager/podcast_cubit/podcast_cubit.dart';
import '../../../meditations/presentation/manager/recommended_articles_cubit/recommended_articles_cubit.dart';
import '../../../meditations/presentation/manager/recommended_books_cubit/recommended_books_cubit.dart';
import '../../../meditations/presentation/manager/recommended_videos_cubit/recommended_videos_cubit.dart';
import '../../../meditations/presentation/views/meditations_view.dart';

class MeditationsProvidersWrapper extends StatelessWidget {
  final bool isPremium;
  const MeditationsProvidersWrapper({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PodcastCubit(podcastRepo: getIt.get<PodcastRepo>())
                ..getPodcastTracks(),
        ),
        BlocProvider(
          create: (context) =>
              AsmrCubit(audioRepo: getIt.get<AsmrRepo>())..getASMRTracks(),
        ),
        BlocProvider(
          create: (context) => RecommendedBooksCubit(
            recommendedBooksRepo: getIt.get<RecommendedBooksRepo>(),
          )..getRecommendedBooks(),
        ),
        BlocProvider(
          create: (context) => RecommendedArticlesCubit(
            recommendedArticlesRepo: getIt.get<RecommendedArticlesRepo>(),
          )..getRecommendedArticles(),
        ),
        BlocProvider(
          create: (context) => RecommendedVideosCubit(
            recommendedVideosRepo: getIt.get<RecommendedVideosRepo>(),
          )..getRecommendedVideos(),
        ),
      ],
      child: MeditationsView(isPremium: isPremium),
    );
  }
}
