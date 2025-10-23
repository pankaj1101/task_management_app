// lib/presentation/core/theme/app_theme.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/constants/app_colors.dart';
// import AppColors, ScreenUtil, etc.

class AppTheme {
  // Define your global theme data
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'SF Pro Display',
    primaryColor: AppColors.primaryColor,

    // CHECKBOX THEME HERE
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(width: 1, color: AppColors.greyColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5.r),
      ),
    ),

    // ADD YOUR INPUT DECORATION THEME HERE
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 12.r,
        fontWeight: FontWeight.w500,
        color: AppColors.greyColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(10.r),
      ),
      // Add error border, enabled border, etc., here...
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorColor, width: 1.5),
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
  );
}
