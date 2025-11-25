import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';
import 'package:flutter_engineering/features/curriculum/models/curriculum_data.dart';
import 'package:flutter_engineering/features/curriculum/models/study_day_info.dart';
import 'package:flutter_engineering/features/study_day/widgets/study_day_action_area.dart';
import 'package:flutter_engineering/features/study_day/widgets/study_day_concept_section.dart';
import 'package:flutter_engineering/features/study_day/widgets/study_day_header.dart';
import 'package:flutter_engineering/features/study_day/widgets/study_day_tasks_list.dart';

/// Screen displaying details and tasks for a specific study day
class StudyDayScreen extends StatelessWidget {
  final int phase;
  final int week;
  final int day;
  final StudyDayInfo? dayInfo;

  const StudyDayScreen({
    required this.phase,
    required this.week,
    required this.day,
    this.dayInfo,
    super.key,
  });

  StudyDayInfo _getDayInfo() {
    if (dayInfo != null) {
      return dayInfo!;
    }

    // Fallback: find day info from curriculum data
    final allDays = CurriculumData.getAllDays();

    return allDays.firstWhere(
      (d) => d.phase == phase && d.week == week && d.day == day,
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
            StudyDayHeader(
              phase: info.phase,
              week: info.week,
              day: info.day,
              phaseColor: info.phaseColor,
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
            StudyDayConceptSection(concept: info.concept),
            const SizedBox(height: 24),

            // Tasks section
            StudyDayTasksList(
              tasks: info.tasks,
              phaseColor: info.phaseColor,
            ),
            const SizedBox(height: 32),

            // Study area / action button
            StudyDayActionArea(
              studyRoute: info.studyRoute,
              phaseColor: info.phaseColor,
            ),
          ],
        ),
      ),
    );
  }
}
