import 'package:flutter_engineering/core/theme/app_colors.dart';
import 'package:flutter_engineering/features/curriculum/models/day_info.dart';

/// Complete curriculum data for all 8 weeks
class CurriculumData {
  static List<DayInfo> getAllDays() {
    return [
      // Phase 1: Week 1
      DayInfo(
        phase: 1,
        week: 1,
        day: 1,
        title: 'The Trinity (Widget, Element, RenderObject)',
        concept: 'Widgets are configuration. Elements are lifecycle. RenderObjects are paint/layout.',
        tasks: [
          'Read framework.dart. Draw the three trees for a simple Container(child: Text(\'Hi\')).',
          'Call debugDumpApp() inside a button press and analyze the console output to identify the Element tree structure.',
          'Create a widget that prints to the console inside initState (Element mounting) vs build (Widget configuration) to verify when they run.',
        ],
        phaseColor: AppColors.phase1Color,
      ),
      DayInfo(
        phase: 1,
        week: 1,
        day: 2,
        title: 'The Protocol (Constraints & Sizes)',
        concept: 'Constraints go down. Sizes go up. The parent sets the rules; the child sets the geometry.',
        tasks: [
          'Use LayoutBuilder to print incoming constraints (BoxConstraints). Predict the size of a child before the app runs.',
          'Wrap a Text widget in a ConstrainedBox vs an UnconstrainedBox and observe how the text wrapping behavior changes.',
          'Fix a "RenderFlex overflowed" error by calculating the pixel math manually on paper first, then applying it.',
        ],
        phaseColor: AppColors.phase1Color,
      ),
      DayInfo(
        phase: 1,
        week: 1,
        day: 3,
        title: 'The Frame Pipeline',
        concept: 'Vsync → Build → Layout → Paint → Composite.',
        tasks: [
          'Use DevTools "Track Widget Rebuilds." Intentionally cause a rebuild vs. a repaint and see the difference in the Timeline.',
          'Use SchedulerBinding.instance.addPostFrameCallback to log exactly when a frame is finished rendering.',
          'Override debugFillProperties in a custom widget to expose internal variable states to the DevTools "Widget Details" tree.',
        ],
        phaseColor: AppColors.phase1Color,
      ),
      // Phase 1: Week 2
      DayInfo(
        phase: 1,
        week: 2,
        day: 1,
        title: 'Custom Painters & The Canvas',
        concept: 'Drawing raw pixels without standard widgets.',
        tasks: [
          'Use CustomPaint to draw a complex shape. Implement hit-testing manually (no GestureDetector).',
          'Implement shouldRepaint correctly: return false if properties haven\'t changed and verify paint isn\'t called.',
          'Use PathMetric to animate a line drawing itself (tracing a path) over time.',
        ],
        phaseColor: AppColors.phase1Color,
      ),
      DayInfo(
        phase: 1,
        week: 2,
        day: 2,
        title: 'Leaf & MultiChild RenderObjects',
        concept: 'Creating a widget that skips the "Widget" composition layer.',
        tasks: [
          'Create a SimpleColumn widget by extending MultiChildRenderObjectWidget and writing the layout logic yourself.',
          'Add ParentData to your custom RenderObject to allow children to control their position (similar to how Stack uses Positioned).',
          'Implement computeMinIntrinsicWidth and computeMaxIntrinsicWidth for your custom RenderObject.',
        ],
        phaseColor: AppColors.phase1Color,
      ),
      DayInfo(
        phase: 1,
        week: 2,
        day: 3,
        title: 'Boundaries & Layers',
        concept: 'RepaintBoundary and minimizing dirty regions.',
        tasks: [
          'Create a list with a spinning animation. Wrap it in a RepaintBoundary and verify (via DevTools) that the parent list stops repainting.',
          'Set debugRepaintRainbowEnabled = true in your main.dart to visualize exactly which parts of the screen are being redrawn in real-time.',
          'Compare CPU usage (Profile mode) of a complex animation with and without a RepaintBoundary.',
        ],
        phaseColor: AppColors.phase1Color,
      ),
      // Phase 2: Week 3
      DayInfo(
        phase: 2,
        week: 3,
        day: 1,
        title: 'The Event Loop',
        concept: 'Microtasks vs. Event Queue. Why await doesn\'t create threads.',
        tasks: [
          'Write a script mixing Future.delayed, Future.microtask, and sync code. Predict the print order exactly.',
          'Write a while(true) loop inside a button callback and try to tap another button. Observe how the UI freezes completely (starving the event loop).',
          'Schedule a low-priority task using Timer.run and compare execution order against scheduleMicrotask.',
        ],
        phaseColor: AppColors.phase2Color,
      ),
      DayInfo(
        phase: 2,
        week: 3,
        day: 2,
        title: 'Isolates & Compute',
        concept: 'True multithreading and memory isolation.',
        tasks: [
          'Perform a heavy calculation (Fibonacci/JSON parsing) on the main thread (observe jank), then move it to Isolate.run.',
          'Establish a 2-way communication channel (ping-pong) between the main isolate and a spawned isolate using SendPort.',
          'Use compute to process a large list of strings (e.g., filtering/sorting) off the main thread.',
        ],
        phaseColor: AppColors.phase2Color,
      ),
      DayInfo(
        phase: 2,
        week: 3,
        day: 3,
        title: 'Context & Lifecycle',
        concept: 'BuildContext is just the Element. Why async gaps are dangerous.',
        tasks: [
          'Force a "Looking up a deactivated widget\'s ancestor" error by delaying a navigation pop and inspecting context.',
          'Fix the error using if (!context.mounted) return;.',
          'Use Element.visitChildren (accessed via context) to manually walk the widget tree and find a specific child type.',
        ],
        phaseColor: AppColors.phase2Color,
      ),
      // Phase 2: Week 4
      DayInfo(
        phase: 2,
        week: 4,
        day: 1,
        title: 'Image Pipeline & Caching',
        concept: 'ImageCache, decoding, and memory footprint.',
        tasks: [
          'Load a 4K image. Use cacheWidth to resize it during decoding. Measure heap memory difference in DevTools.',
          'Create a button that calls painting.imageCache.clear() and observe the network requests/re-decoding when images reload.',
          'Implement a custom ImageProvider that logs when loadBuffer is called.',
        ],
        phaseColor: AppColors.phase2Color,
      ),
      DayInfo(
        phase: 2,
        week: 4,
        day: 2,
        title: 'Cold Start & Tracing',
        concept: 'What happens before runApp?',
        tasks: [
          'Run a profile build (flutter run --profile). Use the Timeline view to trace the startup cost.',
          'Identify if "Shader Compilation" or "Dart Initialization" is the bottleneck.',
          'Use deferred as to lazy load a heavy library and measure the impact on initial startup time.',
        ],
        phaseColor: AppColors.phase2Color,
      ),
      DayInfo(
        phase: 2,
        week: 4,
        day: 3,
        title: 'Impeller vs. Skia',
        concept: 'The rendering engine, shaders, and jank.',
        tasks: [
          'Research "Shader Compilation Jank." Run your app with Impeller enabled vs disabled (--enable-impeller=false on Android) and compare frame consistency.',
          'Force Skia on a device that supports Impeller and look for "jank" on the first run of an animation.',
          'Read the Flutter wiki on why Impeller uses precompiled shaders (.blob) instead of runtime compilation.',
        ],
        phaseColor: AppColors.phase2Color,
      ),
    ];
  }

  static List<DayInfo> getDaysByPhase(int phase) {
    return getAllDays().where((day) => day.phase == phase).toList();
  }

  static List<DayInfo> getDaysByWeek(int phase, int week) {
    return getAllDays()
        .where((day) => day.phase == phase && day.week == week)
        .toList();
  }
}
