import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/core/constants/constants_export.dart';

class ProfileItems extends StatelessWidget {
  final VoidCallback onTap;
  final String title, icon;
  final bool isRightIconRequired;

  const ProfileItems({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.isRightIconRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10.r),
      ),
      leading: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: AppColors.primaryColor.withValues(alpha: 0.15),
        ),
        child: SvgPicture.asset(icon, width: 24.r, height: 24.r),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.greyColor,
          fontSize: 16.r,
        ),
      ),
      trailing: isRightIconRequired ? Icon(Icons.arrow_right_alt) : null,
    );
  }
}
