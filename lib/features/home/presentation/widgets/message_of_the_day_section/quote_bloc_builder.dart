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
        switch (state) {
          case QuoteLoadingState():
            return const QuoteShape(
              dailyQuote: DummyQuote.dummyQuote,
              isLoading: true,
            );

          case QuoteSuccessLoadedState(:final QuoteModel quoteModel):
            return QuoteShape(dailyQuote: quoteModel);

          case QuoteFailureState(:final String errorMessage):
            return Center(child: Text(errorMessage));
        }
      },
    );
  }
}
