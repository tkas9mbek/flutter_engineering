import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';
import 'package:flutter_engineering/features/curriculum/models/curriculum_data.dart';
import 'package:flutter_engineering/features/curriculum/models/day_info.dart';

class StudyDayScreen extends StatelessWidget {
  final int phase;
  final int week;
  final int day;
  final DayInfo? dayInfo;

  const StudyDayScreen({
    required this.phase,
    required this.week,
    required this.day,
    this.dayInfo,
    super.key,
  });

  DayInfo _getDayInfo() {
    if (dayInfo != null) return dayInfo!;

    // Fallback: find day info from curriculum data
    final allDays = CurriculumData.getAllDays();
    return allDays.firstWhere(
      (d) => d.phase == phase && d.week == week && d.day == day,
      orElse: () => DayInfo(
        phase: phase,
        week: week,
        day: day,
        title: 'Unknown Day',
        concept: 'Day not found',
        tasks: [],
        phaseColor: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;
    final info = _getDayInfo();

    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        title: Text(
          'Day $day',
          style: textStyles.boldTitle20.copyWith(color: theme.textPrimary),
        ),
        backgroundColor: theme.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phase indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: info.phaseColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: info.phaseColor),
              ),
              child: Text(
                'Phase $phase • Week $week • Day $day',
                style: textStyles.mediumBody12.copyWith(
                  color: info.phaseColor,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              info.title,
              style: textStyles.boldTitle24.copyWith(
                color: theme.textPrimary,
              ),
            ),
            const SizedBox(height: 16),

            // Concept section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Concept',
                    style: textStyles.boldBody16.copyWith(
                      color: theme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    info.concept,
                    style: textStyles.regularBody16.copyWith(
                      color: theme.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tasks section
            Text(
              'Tasks',
              style: textStyles.boldTitle20.copyWith(
                color: theme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),

            ...info.tasks.asMap().entries.map((entry) {
              final index = entry.key;
              final task = entry.value;
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
                          color: info.phaseColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                          border: Border.all(color: info.phaseColor),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: textStyles.boldBody14.copyWith(
                              color: info.phaseColor,
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
            }),

            const SizedBox(height: 32),

            // Study area placeholder
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.border, width: 2),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.edit_note,
                    size: 48,
                    color: theme.textSecondary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your Study Area',
                    style: textStyles.boldTitle18.copyWith(
                      color: theme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fill this space with your learning progress,\ncode experiments, and notes.',
                    style: textStyles.regularBody14.copyWith(
                      color: theme.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
