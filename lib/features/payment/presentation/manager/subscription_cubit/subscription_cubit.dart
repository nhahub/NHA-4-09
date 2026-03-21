import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/subscription_repo.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  final SubscriptionRepo subscriptionRepo;

  SubscriptionCubit({required this.subscriptionRepo})
    : super(SubscriptionInitialState());

  Future<void> checkSubscription() async {
    emit(SubscriptionLoadingState());

    final result = await subscriptionRepo.checkSubscription();

    result.fold(
      (failure) {
        emit(SubscriptionFailureState(message: failure.message));
      },
      (isPremium) {
        emit(SubscriptionSuccessState(isPremium: isPremium));
      },
    );
  }

  Future<void> createSubscription(String type) async {
    emit(SubscriptionLoadingState());

    final result = await subscriptionRepo.createSubscription(type: type);

    result.fold(
      (failure) {
        emit(SubscriptionFailureState(message: failure.message));
      },
      (_) {
        emit(const SubscriptionSuccessState(isPremium: true));
      },
    );
  }
}
