import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/core/constants/constants_export.dart';

class SearchTaskField extends StatelessWidget {
  final TextEditingController controller;
  const SearchTaskField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 40.r,
            color: const Color.fromRGBO(29, 22, 23, 0.07),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.whiteColor,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16.r),
          ),
          prefixIcon: IconButton(
            onPressed: null,
            icon: SvgPicture.asset(AppAssets.searchIcon),
          ),
          hintText: 'Search Task',
          hintStyle: TextStyle(
            fontSize: 12.r,
            fontWeight: FontWeight.w400,
            color: AppColors.grey3Color,
          ),
        ),
      ),
    );
  }
}
