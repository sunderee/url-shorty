import 'package:flutter/material.dart';
import 'package:urlshorty/ui/themes/color.theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorTheme.colorProduct,
    scaffoldBackgroundColor: ColorTheme.colorBackgroundLight,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      centerTitle: true,
      color: ColorTheme.colorBackgroundLight,
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.black87,
      ),
    ),
  );

  const AppTheme._();
}
