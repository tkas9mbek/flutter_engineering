import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';
import 'package:flutter_engineering/features/curriculum/models/curriculum_data.dart';
import 'package:flutter_engineering/features/curriculum/widgets/day_tile.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;
    final allDays = CurriculumData.getAllDays();

    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        title: Text(
          'Flutter Engineer Curriculum',
          style: textStyles.boldTitle20.copyWith(color: theme.textPrimary),
        ),
        backgroundColor: theme.surface,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: allDays.length,
        itemBuilder: (context, index) {
          final dayInfo = allDays[index];
          return DayTile(dayInfo: dayInfo);
        },
      ),
    );
  }
}
