import 'package:flutter/material.dart';
import 'package:flutter_engineering/core/router/app_router.dart';
import 'package:flutter_engineering/core/theme/app_theme.dart';
import 'package:flutter_engineering/core/theme/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.light();

    return ThemeProvider(
      theme: appTheme,
      child: MaterialApp.router(
        title: 'Flutter Engineering',
        debugShowCheckedModeBanner: false,
        theme: appTheme.toThemeData(),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
