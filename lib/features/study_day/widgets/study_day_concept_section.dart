import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';

/// Section displaying the main concept of the study day
class StudyDayConceptSection extends StatelessWidget {
  final String concept;

  const StudyDayConceptSection({
    required this.concept,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Concept',
            style: textStyles.boldBody16.copyWith(
              color: theme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            concept,
            style: textStyles.regularBody16.copyWith(
              color: theme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
