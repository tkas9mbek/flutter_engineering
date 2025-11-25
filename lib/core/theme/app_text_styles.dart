import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/app_theme.dart';

class AppTextStyles {
  final AppTheme theme;

  /// Title styles - Large (24)
  final TextStyle regularTitle24;
  final TextStyle mediumTitle24;
  final TextStyle boldTitle24;

  /// Title styles - Medium (20)
  final TextStyle regularTitle20;
  final TextStyle mediumTitle20;
  final TextStyle boldTitle20;

  /// Title styles - Small (18)
  final TextStyle regularTitle18;
  final TextStyle mediumTitle18;
  final TextStyle boldTitle18;

  /// Body styles - Large (16)
  final TextStyle regularBody16;
  final TextStyle mediumBody16;
  final TextStyle boldBody16;

  /// Body styles - Medium (14)
  final TextStyle regularBody14;
  final TextStyle mediumBody14;
  final TextStyle boldBody14;

  /// Body styles - Small (12)
  final TextStyle regularBody12;
  final TextStyle mediumBody12;
  final TextStyle boldBody12;

  AppTextStyles(this.theme)
      : regularTitle24 = _base(theme).copyWith(
          fontSize: 24,
          height: 32 / 24,
          fontWeight: FontWeight.w400,
        ),
        mediumTitle24 = _base(theme).copyWith(
          fontSize: 24,
          height: 32 / 24,
          fontWeight: FontWeight.w500,
        ),
        boldTitle24 = _base(theme).copyWith(
          fontSize: 24,
          height: 32 / 24,
          fontWeight: FontWeight.w700,
        ),
        regularTitle20 = _base(theme).copyWith(
          fontSize: 20,
          height: 28 / 20,
          fontWeight: FontWeight.w400,
        ),
        mediumTitle20 = _base(theme).copyWith(
          fontSize: 20,
          height: 28 / 20,
          fontWeight: FontWeight.w500,
        ),
        boldTitle20 = _base(theme).copyWith(
          fontSize: 20,
          height: 28 / 20,
          fontWeight: FontWeight.w700,
        ),
        regularTitle18 = _base(theme).copyWith(
          fontSize: 18,
          height: 24 / 18,
          fontWeight: FontWeight.w400,
        ),
        mediumTitle18 = _base(theme).copyWith(
          fontSize: 18,
          height: 24 / 18,
          fontWeight: FontWeight.w500,
        ),
        boldTitle18 = _base(theme).copyWith(
          fontSize: 18,
          height: 24 / 18,
          fontWeight: FontWeight.w700,
        ),
        regularBody16 = _base(theme).copyWith(
          fontSize: 16,
          height: 24 / 16,
          fontWeight: FontWeight.w400,
        ),
        mediumBody16 = _base(theme).copyWith(
          fontSize: 16,
          height: 24 / 16,
          fontWeight: FontWeight.w500,
        ),
        boldBody16 = _base(theme).copyWith(
          fontSize: 16,
          height: 24 / 16,
          fontWeight: FontWeight.w700,
        ),
        regularBody14 = _base(theme).copyWith(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w400,
        ),
        mediumBody14 = _base(theme).copyWith(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w500,
        ),
        boldBody14 = _base(theme).copyWith(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w700,
        ),
        regularBody12 = _base(theme).copyWith(
          fontSize: 12,
          height: 16 / 12,
          fontWeight: FontWeight.w400,
        ),
        mediumBody12 = _base(theme).copyWith(
          fontSize: 12,
          height: 16 / 12,
          fontWeight: FontWeight.w500,
        ),
        boldBody12 = _base(theme).copyWith(
          fontSize: 12,
          height: 16 / 12,
          fontWeight: FontWeight.w700,
        );

  static TextStyle _base(AppTheme theme) => TextStyle(
        color: theme.textPrimary,
        leadingDistribution: TextLeadingDistribution.even,
      );
}
