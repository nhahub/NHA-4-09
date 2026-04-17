import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/therapist_model.dart';
import '../../../data/repos/therapist_repo.dart';
part 'therapist_state.dart';

class TherapistCubit extends Cubit<TherapistState> {
  final TherapistRepo _therapistRepo;

  TherapistCubit({required TherapistRepo therapistRepo})
    : _therapistRepo = therapistRepo,
      super(GetTherapistsLoadingState());

  void getTherapists() async {
    try {
      final List<TherapistModel> therapists = await _therapistRepo
          .getTherapists();
      emit(GetTherapistsLoadedState(therapists: therapists));
    } catch (e) {
      emit(
        GetTherapistFailureState(
          errorMsg: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
