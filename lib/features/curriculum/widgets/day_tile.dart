import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';
import 'package:flutter_engineering/features/curriculum/models/study_day_info.dart';
import 'package:go_router/go_router.dart';

class DayTile extends StatelessWidget {
  final StudyDayInfo dayInfo;

  const DayTile({
    required this.dayInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          context.pushNamed(
            'study-day',
            pathParameters: {
              'phase': '${dayInfo.phase}',
              'week': '${dayInfo.week}',
              'day': '${dayInfo.day}',
            },
            extra: dayInfo,
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Phase indicator
              Container(
                width: 4,
                height: 60,
                decoration: BoxDecoration(
                  color: dayInfo.phaseColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 16),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Day header
                    Text(
                      'Phase ${dayInfo.phase} • Week ${dayInfo.week} • Day ${dayInfo.day}',
                      style: textStyles.mediumBody12.copyWith(
                        color: theme.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Title
                    Text(
                      dayInfo.title,
                      style: textStyles.boldBody16.copyWith(
                        color: theme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Concept
                    Text(
                      dayInfo.concept,
                      style: textStyles.regularBody14.copyWith(
                        color: theme.textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Arrow icon
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: theme.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
