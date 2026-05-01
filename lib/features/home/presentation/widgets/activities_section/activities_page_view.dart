import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../data/models/activity/activity_model.dart';
import 'activity_dots_indicator.dart';
import 'activity_item.dart';
import 'navigation_buttons.dart';

class ActivitiesPageView extends StatefulWidget {
  final List<ActivityModel> activities;
  final bool isLoading;

  const ActivitiesPageView({
    super.key,
    required this.activities,
    this.isLoading = false,
  });

  @override
  State<ActivitiesPageView> createState() => _ActivitiesPageViewState();
}

class _ActivitiesPageViewState extends State<ActivitiesPageView> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  void next() {
    if (currentIndex < widget.activities.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previous() {
    if (currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasMultiple = widget.activities.length > 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.activities.length,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, index) {
                return ActivityItem(
                  activity: widget.activities[index],
                  isLoading: widget.isLoading,
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          NavigationButtons(
            onNext: next,
            onPrevious: previous,
            isFirst: currentIndex == 0,
            isLast: currentIndex == widget.activities.length - 1,
            hasMultiple: hasMultiple,
          ),
          const SizedBox(height: 20),
          ActivityDotsIndicator(widget: widget, currentIndex: currentIndex),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
