import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/audio_model.dart';
import '../../../data/models/dummy/dummy_audio.dart';
import '../../manager/audio_cubit/audio_cubit.dart';
import 'asmr_list_view.dart';

class AsmrBlocBuilder extends StatelessWidget {
  const AsmrBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        switch (state) {
          case AudioLoadingState():
            return AsmrListView(
              tracks: DummyTracks.dummyTracks,
              isLoading: true,
            );
          case AudioLoadedSuccessState(tracks: final List<AudioModel> tracks):
            return AsmrListView(tracks: tracks);
          case AudioFailureState(message: final String msg):
            return Text(msg);
        }
      },
    );
  }
}
