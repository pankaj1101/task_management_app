import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management_app/core/constants/constants_export.dart';
import 'package:task_management_app/presentation/pages/profile/components/profile_items.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // top section...
          _profileTopSection(),
          // middle section...
          Padding(
            padding: EdgeInsets.all(32.r),
            child: Column(
              spacing: 15,
              children: [
                SizedBox(height: 100.h),
                ProfileItems(
                  onTap: () {},
                  title: 'Edit Profile',
                  icon: AppAssets.editIcon,
                ),
                ProfileItems(
                  onTap: () {},
                  title: 'Change Password',
                  icon: AppAssets.lockIcon,
                ),
                ProfileItems(
                  onTap: () {},
                  title: 'Log out',
                  icon: AppAssets.logoutIcon,
                  isRightIconRequired: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _profileTopSection() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.asset(AppAssets.profileBackground, width: double.infinity),
        // profile avatar
        Positioned(
          bottom: -60.r,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 120.r,
                height: 120.r,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(AppAssets.dummyPersonImageUrl),
                  ),
                  border: Border.all(color: AppColors.whiteColor, width: 4),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 5.r,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.primaryColor,
                  child: SvgPicture.asset(
                    AppAssets.editIcon,
                    colorFilter: ColorFilter.mode(
                      AppColors.whiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: -50,
                child: Column(
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                        fontSize: 20.r,
                      ),
                    ),
                    Text(
                      'Marketing Manager',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey1Color,
                        fontSize: 12.r,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
