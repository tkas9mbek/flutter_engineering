import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/app_colors.dart';

/// Application theme configuration with light and dark mode support.
class AppTheme {
  final ThemeMode themeMode;

  final Color primary;
  final Color secondary;
  final Color surface;
  final Color background;
  final Color border;
  final Color error;
  final Color success;
  final Color warning;
  final Color onPrimary;
  final Color onStatus;
  final Color textPrimary;
  final Color textSecondary;

  AppTheme._({
    required this.themeMode,
    required this.primary,
    required this.secondary,
    required this.surface,
    required this.background,
    required this.border,
    required this.error,
    required this.success,
    required this.warning,
    required this.onPrimary,
    required this.onStatus,
    required this.textPrimary,
    required this.textSecondary,
  });

  factory AppTheme.light() => AppTheme._(
        themeMode: ThemeMode.light,
        primary: AppColors.engineeringBlue,
        secondary: AppColors.accentOrange,
        surface: AppColors.pureWhite,
        background: AppColors.lightBackground,
        border: AppColors.lightBorder,
        error: AppColors.errorRed,
        success: AppColors.successGreen,
        warning: AppColors.warningAmber,
        onPrimary: AppColors.whiteText,
        onStatus: AppColors.onStatusText,
        textPrimary: AppColors.blackText,
        textSecondary: AppColors.greyText,
      );

  factory AppTheme.dark() => AppTheme._(
        themeMode: ThemeMode.dark,
        primary: AppColors.lightEngBlue,
        secondary: AppColors.accentOrange,
        surface: AppColors.darkSurface,
        background: AppColors.darkBackground,
        border: AppColors.darkBorder,
        error: AppColors.lightRed,
        success: AppColors.successGreen,
        warning: AppColors.warningAmber,
        onPrimary: AppColors.blackText,
        onStatus: AppColors.onStatusText,
        textPrimary: AppColors.whiteText,
        textSecondary: AppColors.lightGreyText,
      );

  /// Converts this AppTheme to Flutter's ThemeData.
  ThemeData toThemeData() {
    return ThemeData(
      brightness: themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme(
        brightness: themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light,
        primary: primary,
        onPrimary: onPrimary,
        secondary: secondary,
        onSecondary: onPrimary,
        error: error,
        onError: onStatus,
        surface: surface,
        onSurface: textPrimary,
      ),
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        foregroundColor: textPrimary,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
