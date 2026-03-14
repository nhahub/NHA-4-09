import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_reviews/display_anonymously_item.dart';

class DisplayAnonymouslyWidget extends StatefulWidget {
  final ValueChanged<int> onSelectionChanged;
  const DisplayAnonymouslyWidget({super.key, required this.onSelectionChanged});

  @override
  State<DisplayAnonymouslyWidget> createState() =>
      _DisplayAnonymouslyWidgetState();
}

class _DisplayAnonymouslyWidgetState extends State<DisplayAnonymouslyWidget> {
  int selectedIndex = 0;
  void _updateSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onSelectionChanged(selectedIndex); // ← نرسل القيمة للـ parent
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DisplayAnonymouslyItem(
          title: "Display With Your Name",
          icon: AppAssets.humanIcon,
          isSelected: selectedIndex == 0,
          onTap: () => _updateSelection(0),
        ),
        const SizedBox(height: 15),
        DisplayAnonymouslyItem(
          title: "Display Anonymously",
          icon: AppAssets.anonymousIcon,
          isSelected: selectedIndex == 1,
          onTap: () => _updateSelection(1),
        ),
      ],
    );
  }
}
