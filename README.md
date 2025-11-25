# From Widget Operator to Flutter Engineer

This repository documents my journey moving beyond superficial Flutter development into deep engineering. The goal is to understand the underlying systems—RenderObjects, Event Loops, Native Bridges, and Build Systems—so I am no longer dependent on "magic" packages.

---

## Phase 1: The Engine Room (Rendering & Layout)

**Goal:** Stop guessing how layouts work. Understand RenderObject, constraints, and the pixel pipeline.

### Week 1: The Physics of Flutter

#### Day 1: The Trinity (Widget, Element, RenderObject)

**Concept:** Widgets are configuration. Elements are lifecycle. RenderObjects are paint/layout.

**Tasks:**
- Read `framework.dart`. Draw the three trees for a simple `Container(child: Text('Hi'))`.
- Call `debugDumpApp()` inside a button press and analyze the console output to identify the Element tree structure.
- Create a widget that prints to the console inside `initState` (Element mounting) vs `build` (Widget configuration) to verify when they run.

#### Day 2: The Protocol (Constraints & Sizes)

**Concept:** Constraints go down. Sizes go up. The parent sets the rules; the child sets the geometry.

**Tasks:**
- Use `LayoutBuilder` to print incoming constraints (`BoxConstraints`). Predict the size of a child before the app runs.
- Wrap a `Text` widget in a `ConstrainedBox` vs an `UnconstrainedBox` and observe how the text wrapping behavior changes.
- Fix a "RenderFlex overflowed" error by calculating the pixel math manually on paper first, then applying it.

#### Day 3: The Frame Pipeline

**Concept:** Vsync → Build → Layout → Paint → Composite.

**Tasks:**
- Use DevTools "Track Widget Rebuilds." Intentionally cause a rebuild vs. a repaint and see the difference in the Timeline.
- Use `SchedulerBinding.instance.addPostFrameCallback` to log exactly when a frame is finished rendering.
- Override `debugFillProperties` in a custom widget to expose internal variable states to the DevTools "Widget Details" tree.

### Week 2: Advanced Rendering

#### Day 1: Custom Painters & The Canvas

**Concept:** Drawing raw pixels without standard widgets.

**Tasks:**
- Use `CustomPaint` to draw a complex shape. Implement hit-testing manually (no `GestureDetector`).
- Implement `shouldRepaint` correctly: return false if properties haven't changed and verify paint isn't called.
- Use `PathMetric` to animate a line drawing itself (tracing a path) over time.

#### Day 2: Leaf & MultiChild RenderObjects

**Concept:** Creating a widget that skips the "Widget" composition layer.

**Tasks:**
- Create a `SimpleColumn` widget by extending `MultiChildRenderObjectWidget` and writing the layout logic yourself.
- Add `ParentData` to your custom RenderObject to allow children to control their position (similar to how `Stack` uses `Positioned`).
- Implement `computeMinIntrinsicWidth` and `computeMaxIntrinsicWidth` for your custom RenderObject.

#### Day 3: Boundaries & Layers

**Concept:** RepaintBoundary and minimizing dirty regions.

**Tasks:**
- Create a list with a spinning animation. Wrap it in a `RepaintBoundary` and verify (via DevTools) that the parent list stops repainting.
- Set `debugRepaintRainbowEnabled = true` in your `main.dart` to visualize exactly which parts of the screen are being redrawn in real-time.
- Compare CPU usage (Profile mode) of a complex animation with and without a `RepaintBoundary`.

---

## Phase 2: The Nervous System (Async & Memory)

**Goal:** Stop causing jank. Understand the Event Loop, Isolates, and memory.

### Week 3: Concurrency

#### Day 1: The Event Loop

**Concept:** Microtasks vs. Event Queue. Why await doesn't create threads.

**Tasks:**
- Write a script mixing `Future.delayed`, `Future.microtask`, and sync code. Predict the print order exactly.
- Write a `while(true)` loop inside a button callback and try to tap another button. Observe how the UI freezes completely (starving the event loop).
- Schedule a low-priority task using `Timer.run` and compare execution order against `scheduleMicrotask`.

#### Day 2: Isolates & Compute

**Concept:** True multithreading and memory isolation.

**Tasks:**
- Perform a heavy calculation (Fibonacci/JSON parsing) on the main thread (observe jank), then move it to `Isolate.run`.
- Establish a 2-way communication channel (ping-pong) between the main isolate and a spawned isolate using `SendPort`.
- Use `compute` to process a large list of strings (e.g., filtering/sorting) off the main thread.

#### Day 3: Context & Lifecycle

**Concept:** BuildContext is just the Element. Why async gaps are dangerous.

**Tasks:**
- Force a "Looking up a deactivated widget's ancestor" error by delaying a navigation pop and inspecting context.
- Fix the error using `if (!context.mounted) return;`.
- Use `Element.visitChildren` (accessed via context) to manually walk the widget tree and find a specific child type.

### Week 4: Optimization

#### Day 1: Image Pipeline & Caching

**Concept:** ImageCache, decoding, and memory footprint.

**Tasks:**
- Load a 4K image. Use `cacheWidth` to resize it during decoding. Measure heap memory difference in DevTools.
- Create a button that calls `painting.imageCache.clear()` and observe the network requests/re-decoding when images reload.
- Implement a custom `ImageProvider` that logs when `loadBuffer` is called.

#### Day 2: Cold Start & Tracing

**Concept:** What happens before runApp?

**Tasks:**
- Run a profile build (`flutter run --profile`). Use the Timeline view to trace the startup cost.
- Identify if "Shader Compilation" or "Dart Initialization" is the bottleneck.
- Use `deferred as` to lazy load a heavy library and measure the impact on initial startup time.

#### Day 3: Impeller vs. Skia

**Concept:** The rendering engine, shaders, and jank.

**Tasks:**
- Research "Shader Compilation Jank." Run your app with Impeller enabled vs disabled (`--enable-impeller=false` on Android) and compare frame consistency.
- Force Skia on a device that supports Impeller and look for "jank" on the first run of an animation.
- Read the Flutter wiki on why Impeller uses precompiled shaders (`.blob`) instead of runtime compilation.

---

## Phase 3: The Blueprint (Architecture & Logic)

**Goal:** Stop depending on UI packages for logic. Build pure Dart systems.

### Week 5: Clean Architecture Principles

#### Day 1: Pure Dart Domains

**Concept:** Separation of concerns.

**Tasks:**
- Write a business logic class (e.g., `CartManager`) that imports nothing from `package:flutter`.
- Create a `main_pure.dart` file that runs this logic in the terminal (CLI) without `runApp`.
- Implement a simple Observer pattern (using Dart Streams) to notify listeners of state changes without `ChangeNotifier`.

#### Day 2: Dependency Injection (DI)

**Concept:** Decoupling and testability.

**Tasks:**
- Refactor a class that creates its own dependencies to accept them via constructor.
- Create a simple "Service Locator" singleton manually (without `get_it`) to manage your dependencies.
- Demonstrate swapping a `RealService` for a `MockService` at the top level `main()` without changing the consumption code.

#### Day 3: Functional Error Handling

**Concept:** Errors as data, not exceptions.

**Tasks:**
- Implement a generic `Result<T, E>` sealed class.
- Refactor a function to return `Result` instead of throwing.
- Chain multiple operations (e.g., fetch → parse → save) where any step can fail, handling the error flow functionally.

### Week 6: Testing The System

#### Day 1: Unit Testing & Mocking

**Concept:** Testing logic in isolation.

**Tasks:**
- Use `mocktail` to mock a database failure and ensure your logic handles it gracefully.
- Test a Dart Stream using `expectLater` and `emitsInOrder` to verify a sequence of state changes.
- Use `setUp` and `tearDown` to manage test environment resources.

#### Day 2: Widget Testing Deep Dive

**Concept:** Testing UI mechanics without an emulator.

**Tasks:**
- Write a test using `pumpAndSettle` to simulate user interaction.
- Use finder strategies (`byIcon`, `byType`, `byKey`) to locate widgets in a complex tree.
- Write a test that validates a specific `BoxDecoration` color is applied to a `Container`.

#### Day 3: Integration & Golden Tests

**Concept:** Pixel-perfect regression testing.

**Tasks:**
- Set up a Golden Test that takes a screenshot of a widget and verifies it matches a master file.
- Run the integration test command with the `--update-goldens` flag to generate the initial reference images.
- Record a performance trace (Timeline) during an integration test using `integration_test` package.

---

## Phase 4: The Metal (Native & Build)

**Goal:** Stop fearing the `android/` and `ios/` folders.

### Week 7: Android & The Bridge

#### Day 1: MethodChannels

**Concept:** Communicating with the host platform.

**Tasks:**
- Write a custom `MethodChannel` to ask Android for battery level (no packages allowed).
- Send a JSON object (`Map`) from Native Kotlin to Dart and parse it.
- Throw a `PlatformException` in Kotlin and catch it specifically in Dart.

#### Day 2: Gradle & Manifests

**Concept:** The Android build system.

**Tasks:**
- Add a custom build flavor (e.g., "staging") in `build.gradle` that changes the App Name.
- Define a `buildConfigField` in Gradle (e.g., "API_URL") and access it inside your Kotlin code.
- Manually upgrade the Kotlin version in the project-level `build.gradle` and resolve any sync errors.

#### Day 3: ProGuard & R8

**Concept:** Obfuscation and code shrinking.

**Tasks:**
- Build a release APK. Analyze the `mapping.txt` to see how code was obfuscated.
- Add a custom rule to `proguard-rules.pro` to prevent a specific model class from being obfuscated.
- Compare the file size of a debug APK vs a release APK.

### Week 8: iOS & CI/CD

#### Day 1: iOS Native (Swift/Obj-C)

**Concept:** The iOS entry point.

**Tasks:**
- Implement the iOS side of your battery level `MethodChannel` in `AppDelegate.swift`.
- Add a custom key-value pair to `Info.plist` and read it from Swift.
- Add a `print()` statement in Swift and find the output in the Flutter debug console.

#### Day 2: Xcode & Podfiles

**Concept:** Managing CocoaPods and signing.

**Tasks:**
- Manually inspect `Podfile.lock`.
- Change the Bundle Version and Build Number in Xcode settings.
- Add a "Run Script" phase in Xcode Build Phases that prints "Hello from Build" during compilation.

#### Day 3: CI/CD Scripting

**Concept:** Automation.

**Tasks:**
- Write a bash script that cleans, tests, and builds your app. Run it locally.
- Add a step to your script that runs `flutter analyze` and fails the script if there are warnings.
- Add a variable `IS_CI=true` and have your script print different output based on that environment variable.
