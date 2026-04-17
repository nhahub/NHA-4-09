import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';

import '../../../data/repos/subscription_repo.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  final SubscriptionRepo _subscriptionRepo;

  SubscriptionCubit({required SubscriptionRepo subscriptionRepo})
    : _subscriptionRepo = subscriptionRepo,
      super(SubscriptionInitialState());

  Future<void> checkSubscription() async {
    emit(SubscriptionLoadingState());

    try {
      final bool isPremium = await _subscriptionRepo.checkSubscription();
      emit(SubscriptionSuccessState(isPremium: isPremium));
    } catch (e) {
      emit(
        SubscriptionFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> createSubscription(String type) async {
    emit(SubscriptionLoadingState());

    try {
      await _subscriptionRepo.createSubscription(type: type);
      emit(const SubscriptionSuccessState(isPremium: true));
    } catch (e) {
      emit(
        SubscriptionFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
