import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/meditations/presentation/manager/asmr_cubit/asmr_cubit.dart';
import 'package:moodly/features/meditations/presentation/manager/podcast_cubit/podcast_cubit.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../meditations/data/repos/audio_repo.dart';
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
              PodcastCubit(audioRepo: getIt.get<AudioRepo>())
                ..getPodcastTracks(),
        ),
        BlocProvider(
          create: (context) =>
              AsmrCubit(audioRepo: getIt.get<AudioRepo>())..getASMRTracks(),
        ),
      ],
      child: MeditationsView(isPremium: isPremium),
    );
  }
}
