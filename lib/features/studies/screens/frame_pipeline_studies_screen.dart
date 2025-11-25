import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/app_colors.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';

/// Studies screen for Day 3: The Frame Pipeline
class FramePipelineStudiesScreen extends StatelessWidget {
  const FramePipelineStudiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        title: Text(
          'Frame Pipeline',
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
                    Icons.sync_alt,
                    size: 48,
                    color: theme.onPrimary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'The Frame Pipeline',
                    style: textStyles.boldTitle24.copyWith(
                      color: theme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Vsync → Build → Layout → Paint → Composite',
                    style: textStyles.regularBody16.copyWith(
                      color: theme.onPrimary.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Pipeline Steps
            _buildPipelineStep(context, 1, 'Vsync', 'Vertical sync signal triggers frame', AppColors.phase1Color),
            _buildPipelineStep(context, 2, 'Build', 'Widget tree creates Element tree', AppColors.phase1Color),
            _buildPipelineStep(context, 3, 'Layout', 'RenderObjects calculate positions & sizes', AppColors.phase1Color),
            _buildPipelineStep(context, 4, 'Paint', 'RenderObjects paint to layers', AppColors.phase1Color),
            _buildPipelineStep(context, 5, 'Composite', 'Layers combined to final image', AppColors.phase1Color),
            const SizedBox(height: 32),

            // Coming Soon
            _buildPlaceholder(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPipelineStep(BuildContext context, int step, String title, String description, Color color) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$step',
                style: textStyles.boldBody14.copyWith(color: theme.onPrimary),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textStyles.boldBody16.copyWith(color: theme.textPrimary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: textStyles.regularBody14.copyWith(color: theme.textSecondary),
                  ),
                ],
              ),
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
            'Explore DevTools, addPostFrameCallback, and debugFillProperties.',
            style: textStyles.regularBody14.copyWith(color: theme.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
