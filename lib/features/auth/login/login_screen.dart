import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/core/constants/constants_export.dart';
import 'package:task_management_app/widgets/app_button_widget.dart';
import 'package:task_management_app/widgets/app_button_with_icon_widget.dart';
import 'package:task_management_app/widgets/app_textformfield.dart';
import 'package:task_management_app/widgets/background_gradient.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradient(),
          Positioned(
            top: 100,
            left: 24.w,
            right: 24.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppAssets.appLogoSecondary),
                SizedBox(height: 60.h),
                Container(
                  width: 343.w,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 18,
                        offset: Offset(0, 4),
                        color: AppColors.secondary500.withValues(alpha: 0.15),
                      ),
                    ],
                  ),
                  constraints: BoxConstraints(maxWidth: 400.w),
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      Text(
                        AppStrings.login,
                        style: TextStyle(
                          fontSize: 32.r,
                          fontWeight: FontWeight.w700,
                          color: AppColors.headlineColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text.rich(
                        TextSpan(
                          text: AppStrings.dontHaveAnAccount,
                          style: TextStyle(
                            fontSize: 12.r,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyColor,
                          ),
                          children: [
                            TextSpan(
                              text: AppStrings.signUp,
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      // 👇 Handle tap here
                                      print('Sign Up tapped');
                                      // Example: Navigate to sign-up screen
                                      // Navigator.pushNamed(context, '/signup');
                                    },
                              style: TextStyle(
                                fontSize: 12.r,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              AppStrings.email,
                              style: TextStyle(
                                fontSize: 12.r,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyColor,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            AppTextFormField(
                              controller: TextEditingController(),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              AppStrings.password,
                              style: TextStyle(
                                fontSize: 12.r,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyColor,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            AppTextFormField(
                              controller: TextEditingController(),
                              obscureText: true,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: AppColors.greyColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (_) {}),
                                Text(
                                  AppStrings.rememberMe,
                                  style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: 12.r,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    AppStrings.forgotPasswordText,
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 12.r,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            AppButtonWidget(
                              onTap: () {},
                              btnText: AppStrings.loginText,
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(color: AppColors.borderColor),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    AppStrings.orText,
                                    style: TextStyle(
                                      fontSize: 12.r,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(color: AppColors.borderColor),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            AppButtonWithIconWidget(
                              onTap: () {},
                              btnText: AppStrings.continueWithGoogle,
                            ),
                            SizedBox(height: 5.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
