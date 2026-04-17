import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/quote/quote_model.dart';
import '../../../data/repos/quote_repo.dart';
part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final QuoteRepo _quoteRepo;
  QuoteCubit({required QuoteRepo quoteRepo})
    : _quoteRepo = quoteRepo,
      super(QuoteLoadingState());

  void getQuoteOfTheDay() async {
    try {
      final QuoteModel quoteModel = await _quoteRepo.getQuoteOfTheDay();
      emit(QuoteSuccessLoadedState(quoteModel: quoteModel));
    } catch (e) {
      emit(
        QuoteFailureState(
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
