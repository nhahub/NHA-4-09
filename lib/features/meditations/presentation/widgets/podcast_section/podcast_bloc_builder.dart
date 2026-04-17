import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'podcast_list_view.dart';
import '../../../data/models/audio_model.dart';
import '../../../data/models/dummy/dummy_audio.dart';
import '../../manager/podcast_cubit/podcast_cubit.dart';

class PodcastBlocBuilder extends StatelessWidget {
  const PodcastBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PodcastCubit, PodcastState>(
      builder: (context, state) {
        switch (state) {
          case PodcastLoadingState():
            return PodcastListView(
              podcastTracks: DummyTracks.dummyTracks,
              isLoading: true,
            );
          case PodcastLoadedState(
            podcastTracks: final List<AudioModel> podcastTracks,
          ):
            return PodcastListView(podcastTracks: podcastTracks);
          case PodcastFailureState(message: final String msg):
            return Text(msg);
        }
      },
    );
  }
}
