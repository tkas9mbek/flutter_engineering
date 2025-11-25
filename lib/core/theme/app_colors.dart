import 'package:flutter/material.dart';

/// Application color palette for Flutter Engineering project.
/// Colors chosen to represent technical depth and learning.
class AppColors {
  // Primary colors - Deep blue representing depth and engineering
  static const Color engineeringBlue = Color(0xFF1976D2);
  static const Color lightEngBlue = Color(0xFF64B5F6);
  static const Color accentOrange = Color(0xFFFF9800);

  // Background colors
  static const Color lightBackground = Color(0xFFF5F7FA);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF0D1117);
  static const Color darkSurface = Color(0xFF161B22);

  // Status colors
  static const Color errorRed = Color(0xFFD32F2F);
  static const Color lightRed = Color(0xFFEF5350);
  static const Color successGreen = Color(0xFF388E3C);
  static const Color warningAmber = Color(0xFFFFA726);

  // Text colors
  static const Color blackText = Color(0xFF0D1117);
  static const Color greyText = Color(0xFF6E7681);
  static const Color whiteText = Color(0xFFFFFFFF);
  static const Color lightGreyText = Color(0xFF8B949E);
  static const Color onStatusText = Color(0xFFFFFFFF);

  // Border colors
  static const Color lightBorder = Color(0xFFD0D7DE);
  static const Color darkBorder = Color(0xFF30363D);

  // Accent colors for different phases
  static const Color phase1Color = Color(0xFF2196F3); // Engine Room - Blue
  static const Color phase2Color = Color(0xFF9C27B0); // Nervous System - Purple
  static const Color phase3Color = Color(0xFF4CAF50); // Blueprint - Green
  static const Color phase4Color = Color(0xFFFF5722); // Metal - Orange/Red
}
