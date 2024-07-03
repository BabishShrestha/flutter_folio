import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/colors_ui.dart';

class UITheme {
  static final themeData = ThemeData(
    primaryColor: UIColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: UIColors.backgroundColor,
      titleTextStyle: TextStyle(color: UIColors.bgtextColor),
    ),
    scaffoldBackgroundColor: UIColors.backgroundColor,
  );
}
