import 'package:flutter/material.dart';
import 'package:urlshorty/ui/themes/color.theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorTheme.colorProduct,
    scaffoldBackgroundColor: ColorTheme.colorBackgroundLight,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      color: ColorTheme.colorBackgroundLight,
    ),
  );

  const AppTheme._();
}
