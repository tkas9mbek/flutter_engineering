import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';

/// Header widget showing phase, week, and day information
class StudyDayHeader extends StatelessWidget {
  final int phase;
  final int week;
  final int day;
  final Color phaseColor;

  const StudyDayHeader({
    required this.phase,
    required this.week,
    required this.day,
    required this.phaseColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = ThemeProvider.of(context).textStyles;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: phaseColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: phaseColor),
      ),
      child: Text(
        'Phase $phase • Week $week • Day $day',
        style: textStyles.mediumBody12.copyWith(
          color: phaseColor,
        ),
      ),
    );
  }
}
