import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/therapist_model.dart';
import '../../../data/repos/therapist_repo.dart';

part 'therapist_state.dart';

class TherapistCubit extends Cubit<TherapistState> {
  final TherapistRepo therapistRepo;

  TherapistCubit({required this.therapistRepo})
    : super(GetTherapistsLoadingState());

  void getTherapists() async {
    final Either<Failure, List<TherapistModel>> result = await therapistRepo
        .getTherapists();

    result.fold(
      (failure) => emit(GetTherapistFailureState(errorMsg: failure.message)),
      (therapists) => emit(GetTherapistsLoadedState(therapists: therapists)),
    );
  }
}
