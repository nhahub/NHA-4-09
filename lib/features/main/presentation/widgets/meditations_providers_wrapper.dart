import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../meditations/data/repos/audio_repo.dart';
import '../../../meditations/presentation/manager/audio_cubit/audio_cubit.dart';
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
              AudioCubit(audioRepo: getIt.get<AudioRepo>())..getAudioTracks(),
        ),
      ],
      child: MeditationsView(isPremium: isPremium),
    );
  }
}
