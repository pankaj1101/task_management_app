import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/core/constants/constants_export.dart';
import 'package:task_management_app/core/enums/task_priority_enums.dart';

import 'components/home_header.dart';
import 'components/task_card_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            HomeHeader(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color:
                                    index != 0
                                        ? AppColors.lightGreyColor
                                        : Colors.transparent,
                              ),
                              color:
                                  index != 0
                                      ? AppColors.whiteColor
                                      : AppColors.primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 20,
                                  color: Color.fromRGBO(0, 0, 0, 0.04),
                                ),
                              ],
                            ),
                            child: Text(
                              'To-do',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r,
                                color:
                                    index != 0
                                        ? AppColors.greyColor
                                        : AppColors.whiteColor,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => SizedBox(width: 10.r),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_list,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  // Image.asset(AppAssets.emptyTodoList),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 2,
                      padding: EdgeInsets.zero,
                      itemBuilder: (ctx, index) {
                        return TaskCardItem(
                          priority:
                              index == 0
                                  ? TaskPriorityEnums.high
                                  : TaskPriorityEnums.medium,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.neutralSecondaryColor,

        onTap: (value) {},
        currentIndex: 2,

        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppAssets.homeIcon,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(
              AppAssets.homeIcon,
              colorFilter: ColorFilter.mode(
                AppColors.neutralSecondaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppAssets.notificationIcon,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(
              AppAssets.notificationIcon,
              colorFilter: ColorFilter.mode(
                AppColors.neutralSecondaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppAssets.calenderIconB,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(
              AppAssets.calenderIconB,
              colorFilter: ColorFilter.mode(
                AppColors.neutralSecondaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.neutralSecondaryColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
