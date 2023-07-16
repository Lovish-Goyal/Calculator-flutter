import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import 'calculator_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    final isPlatform = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    final initTheme = isPlatform ? ThemeData.dark() : ThemeData.light();
    return ThemeProvider(
        initTheme: initTheme,
        builder: (context, myTheme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: myTheme,
            title: 'calculator App',
            home: CalculatorScreen(),
          );
        });
  }
}
