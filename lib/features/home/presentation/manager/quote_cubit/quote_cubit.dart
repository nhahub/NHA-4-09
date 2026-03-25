import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/quote/quote_model.dart';
import '../../../data/repos/quote_repo.dart';
import '../../../../../core/errors/failure.dart';
part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final QuoteRepo quoteRepo;
  QuoteCubit({required this.quoteRepo}) : super(QuoteLoadingState());

  void getQuoteOfTheDay() async {
    final Either<Failure, QuoteModel> response = await quoteRepo
        .getQuoteOfTheDay();
    response.fold(
      (failure) {
        emit(QuoteFailureState(errorMessage: failure.message));
      },
      (quoteModel) {
        emit(QuoteSuccessLoadedState(quoteModel: quoteModel));
      },
    );
  }
}
