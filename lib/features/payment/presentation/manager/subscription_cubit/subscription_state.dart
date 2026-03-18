part of 'subscription_cubit.dart';

sealed class SubscriptionState extends Equatable {
  const SubscriptionState();

  @override
  List<Object> get props => [];
}

final class SubscriptionInitialState extends SubscriptionState {}

class SubscriptionLoadingState extends SubscriptionState {}

class SubscriptionSuccessState extends SubscriptionState {
  final bool isPremium;
  const SubscriptionSuccessState({required this.isPremium});

  @override
  List<Object> get props => [isPremium];
}

class SubscriptionFailureState extends SubscriptionState {
  final String message;
  const SubscriptionFailureState({required this.message});

  @override
  List<Object> get props => [message];
}
