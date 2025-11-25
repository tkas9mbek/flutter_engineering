import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';
import 'package:flutter_engineering/features/study_day/widgets/study_day_task_item.dart';

/// List of tasks for the study day
class StudyDayTasksList extends StatelessWidget {
  final List<String> tasks;
  final Color phaseColor;

  const StudyDayTasksList({
    required this.tasks,
    required this.phaseColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tasks',
          style: textStyles.boldTitle20.copyWith(
            color: theme.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        ...tasks.asMap().entries.map((entry) {
          return StudyDayTaskItem(
            index: entry.key,
            task: entry.value,
            phaseColor: phaseColor,
          );
        }),
      ],
    );
  }
}
