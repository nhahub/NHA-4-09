import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingInitial());

  void setUserRating({required double userRating}) {
    // emit(
    //   RatingState(
    //     userRating: userRating,
    //   ),
    // );
  }
}
