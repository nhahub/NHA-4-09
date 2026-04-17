import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/meditations/presentation/manager/asmr_cubit/asmr_cubit.dart';

import '../../../data/models/audio_model.dart';
import '../../../data/models/dummy/dummy_audio.dart';
import 'asmr_list_view.dart';

class AsmrBlocBuilder extends StatelessWidget {
  const AsmrBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AsmrCubit, AsmrState>(
      builder: (context, state) {
        switch (state) {
          case AsmrLoadingState():
            return AsmrListView(
              tracks: DummyTracks.dummyTracks,
              isLoading: true,
            );
          case AsmrLoadedState(asmrTracks: final List<AudioModel> asmrTracks):
            return AsmrListView(tracks: asmrTracks);
          case AsmrFailureState(message: final String msg):
            return Text(msg);
        }
      },
    );
  }
}
