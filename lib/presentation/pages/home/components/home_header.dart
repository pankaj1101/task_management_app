import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/constants/constants_export.dart';
import 'package:task_management_app/presentation/widgets/search_task_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 28.r,
            color: AppColors.primaryTextColor,
          ),
        ),
        Text(
          'Mon 20 March 2024',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.r,
            color: AppColors.neutralSecondaryColor,
          ),
        ),
        SearchTaskField(controller: TextEditingController()),
      ],
    );
  }
}