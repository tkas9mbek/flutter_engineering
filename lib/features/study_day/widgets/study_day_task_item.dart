import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';

/// Individual task item with numbered badge
class StudyDayTaskItem extends StatelessWidget {
  final int index;
  final String task;
  final Color phaseColor;

  const StudyDayTaskItem({
    required this.index,
    required this.task,
    required this.phaseColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: phaseColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: Border.all(color: phaseColor),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: textStyles.boldBody14.copyWith(
                    color: phaseColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                task,
                style: textStyles.regularBody14.copyWith(
                  color: theme.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
