import 'package:flutter/material.dart';
import 'package:moodly/core/constants/static.dart';

import '../../../../core/theming/app_styles.dart';
import '../../data/models/option_model.dart';
import 'selectable_option_tile.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final List<OptionModel> options;
  final List<String> selectedValues;
  final Function(String) onSelect;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.options,
    required this.selectedValues,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              question,
              style: AppStyles.extraBold27,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Column(
              children: options.map((option) {
                final isSelected = selectedValues.contains(option.id);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SelectableOptionTile(
                    icon: option.icon,
                    text: option.title,
                    isSelected: isSelected,
                    onTap: () => onSelect(option.id),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
