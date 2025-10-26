import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/core/constants/constants_export.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class AppBottomNavigationBar extends ConsumerWidget {
  final String? imageUrl;
  const AppBottomNavigationBar({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return BottomNavigationBar(
      backgroundColor: AppColors.whiteColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.neutralSecondaryColor,

      onTap: (value) {
        ref.read(bottomNavIndexProvider.notifier).state = value;
      },
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
                    backgroundImage: NetworkImage(imageUrl!),
                    radius: 15,
                  )
                  : CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.whiteColor,
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
