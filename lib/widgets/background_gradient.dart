import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/constants/app_colors.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 120,
          left: -100,
          child: Container(
            width: 350.r,
            height: 350.r,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: AppColors.primaryColor, blurRadius: 225),
              ],
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 300,
          right: -100,
          child: Container(
            width: 350.r,
            height: 350.r,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: AppColors.primaryColor, blurRadius: 225),
              ],
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
