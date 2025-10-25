import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants/constants_export.dart';

class FloatingActionWidget extends StatelessWidget {
  final VoidCallback onTap;
  const FloatingActionWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
      shape: CircleBorder(),
      child: Icon(Icons.add, color: AppColors.whiteColor),
    );
  }
}
