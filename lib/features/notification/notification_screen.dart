import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/constants/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: AppColors.whiteColor,
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.greyBorderColor),
                borderRadius: BorderRadiusGeometry.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 16.r,
                    color: AppColors.blackColor.withValues(alpha: 0.07),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 5.h,
                ),
                tileColor: AppColors.whiteColor,

                title: Text(
                  '🔔 Reminder',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.r,
                    color: AppColors.neutralSecondaryColor,
                  ),
                ),
                subtitle: Text(
                  'Your interview with Sarah starts in 30 minutes. Get ready!',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.r,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16.h);
        },
      ),
    );
  }
}
