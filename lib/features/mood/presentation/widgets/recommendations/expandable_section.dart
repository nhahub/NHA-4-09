import 'package:flutter/material.dart';
import 'package:moodly/features/mood/data/models/recommendation.dart';

class ExpandableSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Recommendation> items;

  const ExpandableSection({
    required this.title,
    required this.icon,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(icon),
          title: Text(title, style: Theme.of(context).textTheme.titleMedium),
          children: items
              .map(
                (item) => ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
