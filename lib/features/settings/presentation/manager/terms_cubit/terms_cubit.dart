import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/legal_data_model.dart';
import '../../../data/repos/terms_repo.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  final TermsRepo _termsRepo;

  TermsCubit({required TermsRepo termsRepo})
    : _termsRepo = termsRepo,
      super(TermsLoadingState());

  Future<void> getTerms() async {
    try {
      final List<LegalDataModel> data = await _termsRepo.getTerms();
      emit(TermsLoadedState(data: data));
    } catch (e) {
      emit(
        TermsFailuerState(message: ApiErrorHandler.handle(error: e).message),
      );
    }
  }
}
