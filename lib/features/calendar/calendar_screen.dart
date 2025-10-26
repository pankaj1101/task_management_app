import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/constants/constants_export.dart';
import 'package:task_management_app/core/enums/task_priority_enums.dart';
import 'package:task_management_app/features/home/components/task_card_item.dart';
import 'package:task_management_app/widgets/horizontal_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            HorizontalCalendar(),
            SizedBox(height: 50.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '18 April 2024',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.r,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                    ),

                    SizedBox(height: 24.r),
                    Expanded(
                      child: Column(
                        children: [
                          // Image.asset(AppAssets.emptyTodoList),
                          Expanded(
                            child: ListView.separated(
                              itemCount: 3,
                              padding: EdgeInsets.zero,
                              itemBuilder: (ctx, index) {
                                return TaskCardItem(
                                  priority:
                                      index == 0
                                          ? TaskPriorityEnums.high
                                          : TaskPriorityEnums.medium,
                                );
                              },
                              separatorBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                return SizedBox(height: 10);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
