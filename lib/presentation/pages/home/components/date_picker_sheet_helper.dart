import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/constants/constants_export.dart';
import 'package:task_management_app/core/router/app_router.dart';

void showSelectDateBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(16.r),
    ),
    builder: (BuildContext bContext) {
      final DateTime firstDate = DateTime.utc(2000, 1, 1);
      final DateTime lastDate = DateTime.utc(2030, 12, 31);
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(bContext).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                spacing: 5,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: AppColors.primaryColor,
                        onPrimary: Colors.white,
                      ),
                    ),
                    child: CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: firstDate,
                      lastDate: lastDate,
                      onDateChanged: (_) {
                        AppRouter.pop(bContext);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
