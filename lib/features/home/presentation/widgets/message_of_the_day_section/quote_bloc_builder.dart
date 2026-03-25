import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/dummy/dummy_quote.dart';
import '../../../data/models/quote/quote_model.dart';
import '../../manager/quote_cubit/quote_cubit.dart';
import 'quote_shape.dart';

class QuoteBlocBuilder extends StatelessWidget {
  const QuoteBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteCubit, QuoteState>(
      builder: (context, state) {
        if (state is QuoteLoadingState) {
          return const QuoteShape(
            dailyQuote: DummyQuote.dummyQuote,
            isLoading: true,
          );
        } else if (state is QuoteSuccessLoadedState) {
          final QuoteModel dailyQuote = state.quoteModel;
          return QuoteShape(dailyQuote: dailyQuote);
        } else if (state is QuoteFailureState) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
