import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/constants/app_colors.dart';

class AppButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String btnText;
  const AppButtonWidget({
    super.key,
    required this.onTap,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10.r),
        ),
        minimumSize: Size(double.maxFinite, 48.r),
        backgroundColor: AppColors.primaryColor,
      ),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 14.r,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
