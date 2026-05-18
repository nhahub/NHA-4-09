import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/network_cubit/network_cubit.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../meditations/data/repos/asmr_repo.dart';
import '../../../meditations/data/repos/podcast_repo.dart';
import '../../../meditations/data/repos/recommended_articles_repo.dart';
import '../../../meditations/data/repos/recommended_books_repo.dart';
import '../../../meditations/data/repos/recommended_videos_repo.dart';
import '../../../meditations/presentation/manager/asmr_cubit/asmr_cubit.dart';
import '../../../meditations/presentation/manager/podcast_cubit/podcast_cubit.dart';
import '../../../meditations/presentation/manager/recommended_articles_cubit/recommended_articles_cubit.dart';
import '../../../meditations/presentation/manager/recommended_books_cubit/recommended_books_cubit.dart';
import '../../../meditations/presentation/manager/recommended_videos_cubit/recommended_videos_cubit.dart';
import '../../../meditations/presentation/views/meditations_view.dart';
import '../../../mood/presentation/manager/mood_cubit/mood_cubit.dart';

class MeditationsProvidersWrapper extends StatelessWidget {
  final bool isPremium;
  const MeditationsProvidersWrapper({super.key, required this.isPremium});

  void _retryRequests(BuildContext context) {
    context.read<PodcastCubit>().getPodcastTracks();
    context.read<AsmrCubit>().getASMRTracks();
    final moodState = context.read<MoodCubit>().state;

    if (moodState is MoodSavedState) {
      context.read<RecommendedVideosCubit>().getRecommendedVideos(
        currentMood: moodState.currentMood,
      );
      context.read<RecommendedArticlesCubit>().getRecommendedArticles(
        currentMood: moodState.currentMood,
      );
    }
  }

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
          ),
        ),
        BlocProvider(
          create: (context) => RecommendedArticlesCubit(
            recommendedArticlesRepo: getIt.get<RecommendedArticlesRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => RecommendedVideosCubit(
            recommendedVideosRepo: getIt.get<RecommendedVideosRepo>(),
          ),
        ),
      ],
      child: BlocListener<MoodCubit, MoodState>(
        listener: (context, state) {
          if (state is MoodSavedState) {
            final String currentMood = state.currentMood;
            context.read<RecommendedVideosCubit>().getRecommendedVideos(
              currentMood: currentMood,
            );
            context.read<RecommendedArticlesCubit>().getRecommendedArticles(
              currentMood: currentMood,
            );
            context.read<RecommendedBooksCubit>().getRecommendedBooks(
              currentMood: currentMood,
            );
          }
        },
        child: BlocListener<NetworkCubit, NetworkState>(
          listener: (context, state) {
            if (state.status == NetworkStatus.reconnected) {
              _retryRequests(context);
            }
          },
          child: MeditationsView(isPremium: isPremium),
        ),
      ),
    );
  }
}
