import 'package:flutter/material.dart';

class ThemeConfig{
  static final themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white,elevation: 0)
  );
}