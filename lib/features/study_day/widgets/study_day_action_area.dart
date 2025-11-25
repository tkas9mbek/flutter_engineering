import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';
import 'package:go_router/go_router.dart';

/// Action area showing either a study button or placeholder text
class StudyDayActionArea extends StatelessWidget {
  final String? studyRoute;
  final Color phaseColor;

  const StudyDayActionArea({
    required this.studyRoute,
    required this.phaseColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Container(
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
            studyRoute != null ? Icons.science : Icons.edit_note,
            size: 48,
            color: studyRoute != null ? phaseColor : theme.textSecondary,
          ),
          const SizedBox(height: 16),
          if (studyRoute != null)
            ElevatedButton.icon(
              onPressed: () {
                context.pushNamed(studyRoute!);
              },
              icon: const Icon(Icons.science),
              label: const Text('Start Studies'),
              style: ElevatedButton.styleFrom(
                backgroundColor: phaseColor,
                foregroundColor: theme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
            )
          else
            Column(
              children: [
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
        ],
      ),
    );
  }
}
