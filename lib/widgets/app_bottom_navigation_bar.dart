import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/core/constants/constants_export.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final String? imageUrl;
  const AppBottomNavigationBar({
    super.key,
    this.currentIndex = 0,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.whiteColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.neutralSecondaryColor,

      onTap: (value) {},
      currentIndex: currentIndex,

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
          icon:
              imageUrl != null
                  ? CircleAvatar(
                    backgroundImage: NetworkImage(
                      imageUrl!,
                    ),
                  )
                  : CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.grey3Color,
                    child: Icon(
                      Icons.person,
                      color:
                          currentIndex == 3
                              ? AppColors.primaryColor
                              : AppColors.neutralSecondaryColor,
                    ),
                  ),
          label: 'Profile',
        ),
      ],
    );
  }
}
