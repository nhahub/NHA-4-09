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
      super(const TherapistState(status: TherapistStatus.loading));

  void getTherapists() async {
    try {
      final List<TherapistModel> therapists = await _therapistRepo
          .getTherapists();
      emit(
        state.copyWith(status: TherapistStatus.success, therapists: therapists),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TherapistStatus.failure,
          error: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  void updateReviewsCountAndRating({
    required String therapistId,
    required int change,
    required double? average,
  }) {
    final currentTherapists = state.therapists ?? [];

    final updatedTherapists = currentTherapists.map((therapist) {
      if (therapist.id == therapistId) {
        final currentSummary = therapist.ratingSummary;

        final int newCount = currentSummary.totalCount + change;

        return therapist.copyWith(
          ratingSummary: currentSummary.copyWith(
            totalCount: newCount < 0 ? 0 : newCount,
            rating: average,
          ),
        );
      }

      return therapist;
    }).toList();

    emit(
      state.copyWith(
        status: TherapistStatus.success,
        therapists: updatedTherapists,
      ),
    );
  }
}
