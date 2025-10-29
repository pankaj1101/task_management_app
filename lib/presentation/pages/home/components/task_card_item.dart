import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/core/constants/constants_export.dart';
import 'package:task_management_app/core/enums/task_priority_enums.dart';

class TaskCardItem extends StatelessWidget {
  final TaskPriorityEnums priority;
  const TaskCardItem({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 40.r,
            color: const Color.fromRGBO(29, 22, 23, 0.07),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: _getColorBasedOnPriority(priority),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    spacing: 10,
                    children: [
                      SvgPicture.asset(AppAssets.flagIcon),
                      Text(
                        _getTitleBasedOnPriority(priority),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.r,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton(
                  offset: Offset(0, 40),
                  shadowColor: AppColors.grey3Color.withValues(alpha: 0.7),
                  menuPadding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  color: AppColors.whiteColor,
                  icon: Icon(Icons.more_horiz, color: AppColors.whiteColor),
                  itemBuilder:
                      (BuildContext context) => <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: AppColors.primaryColor,
                                size: 20.r,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Edit',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.r,
                                  color: AppColors.grey1Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const PopupMenuDivider(thickness: 0, height: 1),
                        PopupMenuItem<String>(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_forever,
                                color: AppColors.primaryColor,
                                size: 20.r,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Delete',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.r,
                                  color: AppColors.grey1Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.radio_button_checked,
                      color: _getColorBasedOnPriority(priority),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        'Interview with Alex',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.r,
                          color: AppColors.brownColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.r,
                        vertical: 5.r,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.4),
                        color: Color(0xff218EFD),
                      ),
                      child: Text(
                        'To-Do',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.r,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  'Plan questions, capture insights, and document key takeaways.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.r,
                    color: AppColors.neutralSecondaryColor,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(color: AppColors.borderColor),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(Icons.alarm, color: AppColors.blackColor),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        '10.30 AM',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.r,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    Text(
                      'Mon, 18 Apr 2024',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.r,
                        color: AppColors.neutralSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // return color based on priority...
  Color _getColorBasedOnPriority(TaskPriorityEnums priority) {
    if (priority == TaskPriorityEnums.high) {
      return AppColors.highPriorityColor;
    } else if (priority == TaskPriorityEnums.medium) {
      return AppColors.mediumPriorityColor;
    } else {
      return AppColors.lowPriorityColor;
    }
  }

  String _getTitleBasedOnPriority(TaskPriorityEnums priority) {
    if (priority == TaskPriorityEnums.high) {
      return 'High Priority  ⚠️';
    } else if (priority == TaskPriorityEnums.medium) {
      return 'Medium Priority ⏳';
    } else {
      return 'Low Priority  ✅';
    }
  }
}
