import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/audio_model.dart';
import '../../../data/repos/audio_repo.dart';

part 'asmr_state.dart';

class AsmrCubit extends Cubit<AsmrState> {
  final AudioRepo _audioRepo;

  AsmrCubit({required AudioRepo audioRepo})
    : _audioRepo = audioRepo,
      super(AsmrLoadingState());

  Future<void> getASMRTracks() async {
    try {
      final List<AudioModel> asmrTracks = await _audioRepo.getASMRTracks();
      emit(AsmrLoadedState(asmrTracks: asmrTracks));
    } catch (e) {
      emit(AsmrFailureState(message: ApiErrorHandler.handle(error: e).message));
    }
  }
}
