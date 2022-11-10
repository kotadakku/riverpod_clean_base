import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_size.dart';

class AppTheme{
  static ThemeData appTheme = ThemeData(
    fontFamily: 'SVN-Poppins',
    brightness: Brightness.light,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColor.content.withOpacity(0.8),
      elevation: 1,
      behavior: SnackBarBehavior.floating,
      contentTextStyle: TextStyle(
          color: AppColor.backgroundLight,
          fontWeight: FontWeight.w400,
          fontSize: AppSize.textBase
      ),
    ),
    splashColor: AppColor.accent100,
  );
}