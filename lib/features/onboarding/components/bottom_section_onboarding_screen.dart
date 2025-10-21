import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/constants/app_colors.dart';

class BottomSectionOnboardingScreen extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final int currentPage;
  final int totalPages;

  const BottomSectionOnboardingScreen({
    super.key,
    required this.onSkip,
    required this.onNext,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onSkip,
            child: Text(
              'Skip',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.primaryTextColor,
                fontSize: 16.r,
              ),
            ),
          ),

          Row(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              totalPages,
              (index) => Container(
                width: currentPage == index ? 20.r : 10.r,
                height: 10.r,
                decoration: BoxDecoration(
                  color:
                      currentPage == index
                          ? AppColors.primaryColor
                          : AppColors.lightGreyColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            onPressed: onNext,
            icon: Icon(Icons.keyboard_arrow_right_rounded),
          ),
        ],
      ),
    );
  }
}
