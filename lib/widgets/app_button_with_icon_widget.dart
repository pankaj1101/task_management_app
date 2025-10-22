import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/core/constants/app_assets.dart';
import 'package:task_management_app/core/constants/app_colors.dart';

class AppButtonWithIconWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String btnText;
  const AppButtonWithIconWidget({
    super.key,
    required this.onTap,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: SvgPicture.asset(AppAssets.googleIcon),
      onPressed: onTap,
      label: Text(
        btnText,
        style: TextStyle(
          fontSize: 14.r,
          fontWeight: FontWeight.w600,
          color: AppColors.secondary500,
        ),
      ),
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: AppColors.btnBorderColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10.r),
        ),
        minimumSize: Size(double.maxFinite, 48.r),
        backgroundColor: AppColors.whiteColor,
      ),
    );
  }
}
