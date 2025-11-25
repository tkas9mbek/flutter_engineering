import 'package:flutter_engineering/features/curriculum/models/day_info.dart';
import 'package:flutter_engineering/features/curriculum/screens/curriculum_screen.dart';
import 'package:flutter_engineering/features/study_day/screens/study_day_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'curriculum',
        builder: (context, state) => const CurriculumScreen(),
      ),
      GoRoute(
        path: '/day/:phase/:week/:day',
        name: 'study-day',
        builder: (context, state) {
          final phase = int.parse(state.pathParameters['phase']!);
          final week = int.parse(state.pathParameters['week']!);
          final day = int.parse(state.pathParameters['day']!);
          final dayInfo = state.extra as DayInfo?;

          return StudyDayScreen(
            phase: phase,
            week: week,
            day: day,
            dayInfo: dayInfo,
          );
        },
      ),
    ],
  );
}
