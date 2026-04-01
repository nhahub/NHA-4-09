import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../home/data/repos/quote_repo.dart';
import '../../../home/data/repos/water_repo.dart';
import '../../../home/presentation/manager/cups_of_water_cubit/water_tracking_cubit.dart';
import '../../../home/presentation/manager/quote_cubit/quote_cubit.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../mood/data/repos/mood_progress_repo.dart';
import '../../../mood/data/repos/recommendation_repo.dart';
import '../../../mood/presentation/manager/mood_progress_cubit/mood_progress_cubit.dart';
import '../../../mood/presentation/manager/recommendation_cubit/recommendation_cubit.dart';
import '../../../therapist/data/repos/therapist_repo.dart';
import '../../../therapist/presentation/manager/therapist_cubit/therapist_cubit.dart';

class HomeProvidersWrapper extends StatelessWidget {
  final bool isPremium;

  const HomeProvidersWrapper({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              QuoteCubit(quoteRepo: getIt.get<QuoteRepo>())..getQuoteOfTheDay(),
        ),
        BlocProvider(
          create: (_) =>
              WaterTrackingCubit(waterRepo: getIt.get<WaterRepo>())
                ..getWaterCups(),
        ),
        BlocProvider(
          create: (_) =>
              TherapistCubit(therapistRepo: getIt.get<TherapistRepo>())
                ..getTherapists(),
        ),
        BlocProvider(
          create: (_) => MoodProgressCubit(
            moodProgressRepo: getIt.get<MoodProgressRepo>(),
          ),
        ),
        BlocProvider(
          create: (_) => RecommendationCubit(
            recommendationRepo: getIt.get<RecommendationRepo>(),
          )..getRecommendationData(),
        ),
      ],
      child: HomeView(isPremium: isPremium),
    );
  }
}
