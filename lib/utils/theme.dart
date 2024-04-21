import 'package:flutter/material.dart';
import 'colors.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      dialogTheme: DialogTheme(backgroundColor: AppColors.white),
      useMaterial3: true,
      primaryColor: AppColors.orange,
      fontFamily: 'SF',
      dividerTheme: DividerThemeData(color: AppColors.grey.withOpacity(0.5)),
      scaffoldBackgroundColor: AppColors.kScaffoldBackgroundColor,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        backgroundColor: AppColors.kScaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: AppColors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: AppColors.black,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: AppColors.black,
        ),
      ),
      colorScheme:
          const ColorScheme.light(primary: AppColors.kTextFieldBorderColor));
}
