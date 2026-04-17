import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/legal_data_model.dart';
import '../../../data/repos/privacy_policy_repo.dart';
part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  final PrivacyPolicyRepo _privacyPolicyRepo;

  PrivacyPolicyCubit({required PrivacyPolicyRepo privacyPolicyRepo})
    : _privacyPolicyRepo = privacyPolicyRepo,
      super(PrivacyPolicyLoadingState());

  Future<void> getPrivacyPolicy() async {
    try {
      final List<LegalDataModel> data = await _privacyPolicyRepo
          .getPrivacyPolicy();
      emit(PrivacyPolicyLoadedState(data: data));
    } catch (e) {
      emit(
        PrivacyPolicyFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
