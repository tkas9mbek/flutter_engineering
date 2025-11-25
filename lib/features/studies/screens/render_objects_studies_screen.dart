import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/app_colors.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';

/// Studies screen for Day 5: Leaf & MultiChild RenderObjects
class RenderObjectsStudiesScreen extends StatelessWidget {
  const RenderObjectsStudiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        title: Text(
          'RenderObjects',
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
                    Icons.device_hub,
                    size: 48,
                    color: theme.onPrimary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Custom RenderObjects',
                    style: textStyles.boldTitle24.copyWith(
                      color: theme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Skip the Widget layer and control layout directly',
                    style: textStyles.regularBody16.copyWith(
                      color: theme.onPrimary.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Concepts
            _buildSection(context,
              'MultiChildRenderObjectWidget',
              'Create custom layouts like Column or Stack',
              Icons.view_column,
              AppColors.phase1Color,
            ),
            const SizedBox(height: 16),

            _buildSection(context,
              'ParentData',
              'Let children control their positioning',
              Icons.control_camera,
              AppColors.phase1Color,
            ),
            const SizedBox(height: 16),

            _buildSection(context,
              'Intrinsic Dimensions',
              'Calculate min/max width and height',
              Icons.straighten,
              AppColors.phase1Color,
            ),
            const SizedBox(height: 32),

            // Coming Soon
            _buildPlaceholder(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String description, IconData icon, Color color) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Container(
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
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textStyles.boldBody16.copyWith(color: theme.textPrimary)),
                const SizedBox(height: 4),
                Text(description, style: textStyles.regularBody14.copyWith(color: theme.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.border, width: 2),
      ),
      child: Column(
        children: [
          Icon(Icons.construction, size: 48, color: theme.textSecondary),
          const SizedBox(height: 16),
          Text(
            'Interactive Studies Coming Soon',
            style: textStyles.boldTitle18.copyWith(color: theme.textPrimary),
          ),
          const SizedBox(height: 8),
          Text(
            'Build custom RenderObjects with your own layout logic.',
            style: textStyles.regularBody14.copyWith(color: theme.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
