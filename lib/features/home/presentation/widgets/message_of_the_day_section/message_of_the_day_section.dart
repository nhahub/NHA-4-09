import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../data/models/quote_model.dart';
import '../../../data/repos/quote_repo_impl.dart';
import 'main_card.dart';
import 'rotated_gradient_card.dart';
import 'rotated_inner_shadow_card.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';

class MessageOfTheDaySection extends StatefulWidget {
  static const cardRadius = 20.0;
  static const rotationAngle = 3 * pi / 180;
  static const translateOffset = Offset(0, -10);

  const MessageOfTheDaySection({super.key});

  @override
  State<MessageOfTheDaySection> createState() => _MessageOfTheDaySectionState();
}

class _MessageOfTheDaySectionState extends State<MessageOfTheDaySection> {
  Quote? _dailyQuote;
  final QuoteRepoImpl _quoteRepoImpl = getIt<QuoteRepoImpl>();

  @override
  void initState() {
    super.initState();
    _loadQuote();
  }

  void _loadQuote() async {
    final quote = await _quoteRepoImpl.getQuoteOfTheDay();
    setState(() {
      _dailyQuote = quote;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "Message of the Day"),
        const SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalPadding,
          ),
          child: Stack(
            children: [
              RotatedGradientCard(dailyQuote: _dailyQuote ?? loadingQuote),
              RotatedInnerShadowCard(dailyQuote: _dailyQuote ?? loadingQuote),
              MainCard(dailyQuote: _dailyQuote ?? loadingQuote),
            ],
          ),
        ),
      ],
    );
  }
}
