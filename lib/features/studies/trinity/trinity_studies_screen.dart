import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/app_colors.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';

/// Studies screen for Day 1: The Trinity (Widget, Element, RenderObject)
class TrinityStudiesScreen extends StatelessWidget {
  const TrinityStudiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        title: Text(
          'The Trinity Studies',
          style: textStyles.boldTitle20.copyWith(color: theme.textPrimary),
        ),
        backgroundColor: theme.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.phase1Color,
                    AppColors.phase1Color.withValues(alpha: 0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.science_outlined,
                    size: 48,
                    color: theme.onPrimary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Widget • Element • RenderObject',
                    style: textStyles.boldTitle24.copyWith(
                      color: theme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Explore the three trees that power Flutter',
                    style: textStyles.regularBody16.copyWith(
                      color: theme.onPrimary.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Placeholder Content
            _buildSection(
              context,
              icon: Icons.widgets,
              title: 'Widget Tree',
              description:
                  'Configuration and blueprint. Immutable descriptions of the UI.',
              color: AppColors.phase1Color,
            ),
            const SizedBox(height: 16),

            _buildSection(
              context,
              icon: Icons.account_tree,
              title: 'Element Tree',
              description:
                  'Lifecycle management. Mutable bridge between Widget and RenderObject.',
              color: AppColors.phase1Color,
            ),
            const SizedBox(height: 16),

            _buildSection(
              context,
              icon: Icons.layers,
              title: 'RenderObject Tree',
              description:
                  'Layout and painting. The actual pixel rendering engine.',
              color: AppColors.phase1Color,
            ),
            const SizedBox(height: 32),

            // Placeholder message
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.border, width: 2),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.construction,
                    size: 48,
                    color: theme.textSecondary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Interactive Studies Coming Soon',
                    style: textStyles.boldTitle18.copyWith(
                      color: theme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This section will contain interactive exercises to test your understanding of the Widget, Element, and RenderObject trinity.',
                    style: textStyles.regularBody14.copyWith(
                      color: theme.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textStyles.boldBody16.copyWith(
                    color: theme.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: textStyles.regularBody14.copyWith(
                    color: theme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
