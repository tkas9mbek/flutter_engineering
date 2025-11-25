import 'package:flutter_engineering/features/curriculum/models/study_day_info.dart';
import 'package:flutter_engineering/features/curriculum/screens/curriculum_screen.dart';
import 'package:flutter_engineering/features/studies/screens/boundaries_studies_screen.dart';
import 'package:flutter_engineering/features/studies/screens/constraints_studies_screen.dart';
import 'package:flutter_engineering/features/studies/screens/custom_paint_studies_screen.dart';
import 'package:flutter_engineering/features/studies/screens/frame_pipeline_studies_screen.dart';
import 'package:flutter_engineering/features/studies/screens/render_objects_studies_screen.dart';
import 'package:flutter_engineering/features/studies/trinity/trinity_studies_screen.dart';
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
          final dayInfo = state.extra as StudyDayInfo?;

          return StudyDayScreen(
            phase: phase,
            week: week,
            day: day,
            dayInfo: dayInfo,
          );
        },
      ),
      GoRoute(
        path: '/studies/trinity',
        name: 'trinity-studies',
        builder: (context, state) => const TrinityStudiesScreen(),
      ),
      GoRoute(
        path: '/studies/constraints',
        name: 'constraints-studies',
        builder: (context, state) => const ConstraintsStudiesScreen(),
      ),
      GoRoute(
        path: '/studies/frame-pipeline',
        name: 'frame-pipeline-studies',
        builder: (context, state) => const FramePipelineStudiesScreen(),
      ),
      GoRoute(
        path: '/studies/custom-paint',
        name: 'custom-paint-studies',
        builder: (context, state) => const CustomPaintStudiesScreen(),
      ),
      GoRoute(
        path: '/studies/render-objects',
        name: 'render-objects-studies',
        builder: (context, state) => const RenderObjectsStudiesScreen(),
      ),
      GoRoute(
        path: '/studies/boundaries',
        name: 'boundaries-studies',
        builder: (context, state) => const BoundariesStudiesScreen(),
      ),
    ],
  );
}
