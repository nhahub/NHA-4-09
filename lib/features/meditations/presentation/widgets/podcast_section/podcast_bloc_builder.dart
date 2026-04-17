import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/meditations/presentation/widgets/podcast_section/podcast_list_view.dart';
import '../../../data/models/audio_model.dart';
import '../../../data/models/dummy/dummy_audio.dart';
import '../../manager/audio_cubit/audio_cubit.dart';

class PodcastBlocBuilder extends StatelessWidget {
  const PodcastBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        switch (state) {
          case AudioLoadingState():
            return PodcastListView(
              podcastTracks: DummyTracks.dummyTracks,
              isLoading: true,
            );
          case AudioLoadedSuccessState(tracks: final List<AudioModel> tracks):
            return PodcastListView(podcastTracks: tracks);
          case AudioFailureState(message: final String msg):
            return Text(msg);
        }
      },
    );
  }
}
