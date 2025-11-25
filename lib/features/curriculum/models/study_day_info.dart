import 'package:flutter/material.dart';

/// Information about a specific study day
class StudyDayInfo {
  final int phase;
  final int week;
  final int day;
  final String title;
  final String concept;
  final List<String> tasks;
  final Color phaseColor;
  final String? studyRoute;

  const StudyDayInfo({
    required this.phase,
    required this.week,
    required this.day,
    required this.title,
    required this.concept,
    required this.tasks,
    required this.phaseColor,
    this.studyRoute,
  });

  String get fullTitle => 'Phase $phase, Week $week, Day $day: $title';
}
