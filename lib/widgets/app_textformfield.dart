import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final String hintText;
  final VoidCallback? onTap;

  const AppTextFormField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.hintText = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onTap: onTap,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
