// Helper to open the calendar bottom sheet
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management_app/core/constants/constants_export.dart';

import 'date_picker_sheet_helper.dart';

void showTodoAddBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(16.r),
    ),
    builder: (BuildContext bContext) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(bContext).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.r),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: Text(
                'New Todo',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 18.r,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                spacing: 5,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'eg : Meeting with client',
                      hintStyle: TextStyle(
                        fontSize: 18.r,
                        color: AppColors.grey3Color,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                  TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        fontSize: 18.r,
                        color: AppColors.grey3Color,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showSelectDateBottomSheet(context);
                        },
                        icon: SvgPicture.asset(AppAssets.calenderIconB),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppAssets.clockIcon),
                      ),
                      PopupMenuButton(
                        shadowColor: AppColors.grey3Color.withValues(
                          alpha: 0.7,
                        ),
                        menuPadding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        color: AppColors.whiteColor,
                        icon: SvgPicture.asset(AppAssets.flagIcon1),
                        itemBuilder:
                            (BuildContext context) => <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'high_priority',
                                child: Text(
                                  '⚠️   High Priority',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.r,
                                    color: AppColors.highPriorityColor,
                                  ),
                                ),
                              ),
                              const PopupMenuDivider(thickness: 0, height: 1),
                              PopupMenuItem<String>(
                                value: 'medium_priority',
                                child: Text(
                                  '⏳  Medium Priority',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.r,
                                    color: AppColors.mediumPriorityColor,
                                  ),
                                ),
                              ),
                              const PopupMenuDivider(thickness: 0, height: 1),
                              PopupMenuItem<String>(
                                value: 'low_priority',
                                child: Text(
                                  '✅  Low Priority',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.r,
                                    color: AppColors.lowPriorityColor,
                                  ),
                                ),
                              ),
                            ],
                      ),

                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppAssets.sendIcon),
                      ),
                    ],
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
