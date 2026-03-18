import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/payment/data/models/subscription_model.dart';
import 'package:moodly/features/payment/data/repos/subscription_repo.dart';
import '../../../../../core/errors/failure.dart';
part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  final SubscriptionRepo subscriptionRepo;

  SubscriptionCubit({required this.subscriptionRepo})
    : super(SubscriptionInitialState());

  Future<void> loadSubscription() async {
    emit(SubscriptionLoadingState());

    final String? cachedStatus = subscriptionRepo.getCachedStatus();
    if (cachedStatus != null) {
      emit(SubscriptionSuccessState(isPremium: cachedStatus == 'active'));
    }

    final Either<Failure, SubscriptionModel?> result = await subscriptionRepo
        .getUserActiveSubscription();

    result.fold(
      (failure) {
        emit(SubscriptionFailureState(message: failure.message));
      },
      (subscription) {
        final status = subscription?.status ?? 'inactive';
        emit(SubscriptionSuccessState(isPremium: status == 'active'));
      },
    );
  }
}
