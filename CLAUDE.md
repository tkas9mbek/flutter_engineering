# Flutter Engineering Learning Platform

## Project Overview

A Flutter-based educational application designed to transform widget operators into Flutter engineers through structured, hands-on learning. This is a self-study platform documenting a journey from superficial Flutter development into deep engineering understanding of rendering systems, async patterns, architecture, and native bridges.

## Project Architecture

### Core Structure
```
lib/
├── core/
│   ├── router/          # go_router navigation with study routes
│   ├── theme/           # Comprehensive theming (colors, text styles, theme provider)
│   ├── toolkit/         # Utilities (API client, exceptions, repository executor)
│   └── widgets/         # Reusable components (buttons, status indicators)
└── features/
    ├── curriculum/      # Curriculum display with day tiles
    │   ├── models/      # StudyDayInfo model
    │   ├── screens/     # CurriculumScreen
    │   └── widgets/     # DayTile
    ├── study_day/       # Day detail with extracted widgets
    │   ├── screens/     # StudyDayScreen (refactored)
    │   └── widgets/     # Header, Concept, Tasks, Action widgets
    └── studies/         # Interactive study screens per day
        └── screens/     # Day-specific study implementations
```

### Key Technologies
- **Flutter SDK**: 3.38.3 (latest stable, managed via FVM)
- **Dart**: 3.10.1
- **Navigation**: go_router 17.0.0 (declarative routing with pushNamed)
- **State Management**: InheritedWidget pattern via ThemeProvider
- **Architecture**: Feature-based organization with SOLID principles
- **Linting**: flutter_lints 6.0.0 (strict)

## Learning Curriculum (8 Weeks)

### Phase 1: The Engine Room (Weeks 1-2) 🔵
**Focus**: Rendering pipeline, RenderObjects, constraints, frame lifecycle

**Week 1: The Physics of Flutter**
- Day 1: Widget/Element/RenderObject trinity → `trinity-studies`
- Day 2: Constraints protocol (down) and sizes (up) → `constraints-studies`
- Day 3: Frame pipeline (Vsync → Build → Layout → Paint → Composite) → `frame-pipeline-studies`

**Week 2: Advanced Rendering**
- Day 1: CustomPaint, Canvas API, manual hit-testing → `custom-paint-studies`
- Day 2: Custom RenderObjects (leaf & multi-child) → `render-objects-studies`
- Day 3: RepaintBoundary and layer optimization → `boundaries-studies`

### Phase 2: The Nervous System (Weeks 3-4) 🟣
**Focus**: Event loop, isolates, memory, optimization

**Week 3: Concurrency**
- Day 1: Event loop mechanics (microtasks vs event queue)
- Day 2: Isolates, compute, SendPort communication
- Day 3: BuildContext lifecycle, async safety

**Week 4: Optimization**
- Day 1: ImageCache, decoding, memory profiling
- Day 2: Cold start analysis, deferred loading
- Day 3: Impeller vs Skia rendering engines

### Phase 3: The Blueprint (Weeks 5-6)
**Focus**: Clean architecture, testing, pure Dart logic

**Week 5: Architecture**
- Day 1: Pure Dart domains (Flutter-independent)
- Day 2: Dependency injection patterns
- Day 3: Functional error handling (Result types)

**Week 6: Testing**
- Day 1: Unit testing with mocks
- Day 2: Widget testing deep dive
- Day 3: Integration & golden tests

### Phase 4: The Metal (Weeks 7-8)
**Focus**: Native platforms, build systems, CI/CD

**Week 7: Android**
- Day 1: MethodChannels & platform communication
- Day 2: Gradle, build flavors, manifests
- Day 3: ProGuard/R8 obfuscation

**Week 8: iOS & Deployment**
- Day 1: Swift/Objective-C bridge implementation
- Day 2: Xcode, CocoaPods, signing
- Day 3: CI/CD scripting & automation

## Key Components

### AppRouter (`lib/core/router/app_router.dart`)
Navigation configuration with 3 route types:
1. `/` - CurriculumScreen (main list)
2. `/day/:phase/:week/:day` - StudyDayScreen (detail view)
3. `/studies/{name}` - Interactive study screens (6 implemented for Phase 1)

**Navigation Pattern:**
```dart
// Push to day detail (maintains back stack)
context.pushNamed('study-day',
  pathParameters: {'phase': '1', 'week': '1', 'day': '1'},
  extra: studyDayInfo);

// Push to studies screen
context.pushNamed('trinity-studies');
```

### ThemeProvider (`lib/core/theme/theme_provider.dart`)
InheritedWidget implementation providing:
- AppTheme (colors, surface styles, CardThemeData)
- AppTextStyles (typography system)
- Static `of(context)` accessor

**Usage:**
```dart
final theme = ThemeProvider.of(context).theme;
final textStyles = ThemeProvider.of(context).textStyles;
```

### StudyDayInfo Model (`lib/features/curriculum/models/study_day_info.dart`)
Core data model for curriculum days:
```dart
class StudyDayInfo {
  final int phase;
  final int week;
  final int day;
  final String title;
  final String concept;
  final List<String> tasks;
  final Color phaseColor;
  final String? studyRoute;  // Optional link to studies screen
}
```

### CurriculumData (`lib/features/curriculum/models/curriculum_data.dart`)
Static data repository:
- `getAllDays()` - Returns all 12 days (Phases 1-2)
- `getDaysByPhase(int phase)` - Filter by phase
- `getDaysByWeek(int phase, int week)` - Filter by week

### StudyDayScreen - Refactored Architecture
**Location:** `lib/features/study_day/screens/study_day_screen.dart`

Follows Single Responsibility Principle with extracted widgets:
- **StudyDayHeader** - Phase/week/day badge
- **StudyDayConceptSection** - Concept card display
- **StudyDayTasksList** - Task list with numbered items
- **StudyDayTaskItem** - Individual task card
- **StudyDayActionArea** - Conditional button or placeholder

**Screen responsibility:** Orchestration only (106 lines, down from 213)

### Interactive Studies Screens
Phase 1 has 6 dedicated study screens with consistent design:
- Gradient headers with phase colors
- Concept breakdowns with icons
- Placeholder areas for interactive exercises
- All follow same theming patterns

**Implemented:**
1. `TrinityStudiesScreen` - Widget/Element/RenderObject exploration
2. `ConstraintsStudiesScreen` - BoxConstraints protocol
3. `FramePipelineStudiesScreen` - 5-step pipeline visualization
4. `CustomPaintStudiesScreen` - Canvas & painting concepts
5. `RenderObjectsStudiesScreen` - Custom layout logic
6. `BoundariesStudiesScreen` - RepaintBoundary optimization

## Development Patterns

### Color System
- Phase 1: Blue (`#3B82F6`) - Rendering/Layout
- Phase 2: Purple (`#8B5CF6`) - Async/Memory
- Phase 3: Green - Architecture/Testing (defined)
- Phase 4: Orange - Native/Build (defined)

### Widget Composition Pattern
Use extracted, focused widgets for maintainability:
```dart
// Good: Single responsibility
StudyDayHeader(phase: 1, week: 1, day: 1, phaseColor: color)

// Bad: Inline complex UI in screen
Container(padding: ..., decoration: ..., child: Row(...))
```

### FVM Usage
Project uses FVM for Flutter version management:
```bash
fvm flutter run
fvm flutter pub get
fvm flutter analyze
```

## Current Implementation Status

**Implemented:**
- ✅ Complete curriculum data for Phases 1-2 (12 days)
- ✅ FVM integration with Flutter 3.38.3
- ✅ Updated dependencies (go_router 17.0.0, flutter_lints 6.0.0)
- ✅ Navigation with back button support (pushNamed)
- ✅ Refactored StudyDayScreen with SOLID principles
- ✅ 6 interactive study screens for Phase 1
- ✅ Theme system with InheritedWidget
- ✅ All linting warnings resolved
- ✅ Custom UI components (buttons, progress indicators)
- ✅ Toolkit foundation (API client, error handling)

**Pending:**
- ⏳ Phases 3-4 curriculum data (Weeks 5-8)
- ⏳ Phase 2 interactive study screens (6 days)
- ⏳ Task completion tracking & persistence
- ⏳ Progress analytics dashboard
- ⏳ Search/filter functionality
- ⏳ Dark mode implementation
- ⏳ Interactive exercises within study screens

## Working with This Project

### Adding New Study Days
1. Add `StudyDayInfo` entry to `CurriculumData.getAllDays()`
2. Use appropriate `phaseColor` from `AppColors`
3. Optionally add `studyRoute` if creating dedicated screen
4. Create study screen in `lib/features/studies/screens/`
5. Add route to `AppRouter`

### Creating Study Screens
Template structure:
```dart
class NewStudiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('...')),
      body: SingleChildScrollView(
        child: Column([
          // Gradient header with phase color
          // Concept cards with icons
          // Placeholder for interactive content
        ]),
      ),
    );
  }
}
```

### Extracting Widgets
Follow Single Responsibility:
1. Identify cohesive UI blocks
2. Extract to separate widget file
3. Pass only required data
4. Add clear documentation comment
5. Keep widgets small (<100 lines)

### Testing Strategy
- Unit tests: Pure Dart logic (business rules)
- Widget tests: Isolated widget behavior
- Integration tests: Full user flows
- Follow curriculum Week 6 guidelines

## Code Quality Standards

### Linting
- All warnings must be resolved
- Use `const` constructors where possible
- Avoid escaped quotes in strings
- Sort imports alphabetically
- Use modern APIs (`.withValues()` vs `.withOpacity()`)

### Architecture
- Feature-based folder structure
- Single Responsibility Principle
- Dependency injection ready
- Testable, composable widgets

### Performance
- Appropriate use of `const`
- RepaintBoundary for complex animations
- Lazy loading for heavy resources
- Profile mode testing for bottlenecks

## Design Philosophy

This project emphasizes:
1. **Understanding over abstraction** - Learn underlying systems, not just APIs
2. **Hands-on experimentation** - Every day has practical, executable tasks
3. **Progressive complexity** - Rendering → Async → Architecture → Native
4. **No magic packages** - Build to understand, use packages after learning
5. **Real engineering** - Performance profiling, optimization, build systems
6. **Clean code** - SOLID principles, testability, maintainability

## Running the Project

### Initial Setup
```bash
# Install FVM if needed
dart pub global activate fvm

# Use project Flutter version
fvm use 3.38.3

# Get dependencies
fvm flutter pub get
```

### Development
```bash
# Run app
fvm flutter run

# Analyze code
fvm flutter analyze

# Run tests
fvm flutter test

# Update dependencies
fvm flutter pub upgrade
```

### Building
```bash
# Profile build (for performance testing)
fvm flutter run --profile

# Release build
fvm flutter build apk --release  # Android
fvm flutter build ios --release  # iOS
```

## Next Steps for Contributors

1. **Complete Phase 2 Studies** - Create 6 study screens for async/memory topics
2. **Add Phases 3-4 Data** - Populate architecture and native platform days
3. **Implement Progress Tracking** - Local storage for completed tasks
4. **Interactive Exercises** - Add hands-on coding challenges to study screens
5. **Analytics Dashboard** - Visualize learning progress over time
6. **Dark Mode** - Implement theme switching capability

For detailed curriculum content and learning objectives, see README.md.
