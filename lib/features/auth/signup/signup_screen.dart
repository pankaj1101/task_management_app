import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/application/signup/signup_notifier.dart';
import 'package:task_management_app/core/constants/constants_export.dart';
import 'package:task_management_app/core/router/app_router.dart';
import 'package:task_management_app/widgets/app_button_widget.dart';
import 'package:task_management_app/widgets/app_textformfield.dart';
import 'package:task_management_app/widgets/background_gradient.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _dateOfBirthController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
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
                            color: AppColors.secondary500.withValues(
                              alpha: 0.15,
                            ),
                          ),
                        ],
                      ),
                      constraints: BoxConstraints(maxWidth: 400.w),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      AppRouter.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back),
                                  ),
                                  Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 32.r,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.headlineColor,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text.rich(
                                    TextSpan(
                                      text: 'Already have an account? ',
                                      style: TextStyle(
                                        fontSize: 12.r,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.greyColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Login',
                                          recognizer:
                                              TapGestureRecognizer()
                                                ..onTap = () {
                                                  AppRouter.pop(context);
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

                                  SizedBox(height: 8.h),
                                  //  full name...
                                  Text(
                                    'Full Name',
                                    style: TextStyle(
                                      fontSize: 12.r,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  AppTextFormField(
                                    controller: _fullNameController,
                                    hintText: 'Enter full name',
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    AppStrings.email,
                                    style: TextStyle(
                                      fontSize: 12.r,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  // Email field...
                                  AppTextFormField(
                                    controller: _emailController,
                                    hintText: 'Johndoe@gmail.com',
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    'Date of birth',
                                    style: TextStyle(
                                      fontSize: 12.r,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  AppTextFormField(
                                    controller: _dateOfBirthController,
                                    hintText: 'DD/MM/YYYY',
                                    onTap: () {
                                      // Date Picker code hear...
                                    },
                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        AppAssets.calenderIcon,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    'Phone Number',
                                    style: TextStyle(
                                      fontSize: 12.r,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  AppTextFormField(
                                    controller: _phoneController,
                                    hintText: '9999999999',
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    'Set Password',
                                    style: TextStyle(
                                      fontSize: 12.r,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),

                                  // password field...
                                  Consumer(
                                    builder: (context, ref, _) {
                                      final showPassword = ref.watch(
                                        togglePasswordProvider,
                                      );
                                      final controller = ref.read(
                                        togglePasswordProvider.notifier,
                                      );

                                      return AppTextFormField(
                                        controller: _passwordController,
                                        hintText: '*********',
                                        obscureText: !showPassword,
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            controller.state =
                                                !controller.state;
                                          },
                                          icon: Icon(
                                            showPassword
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: AppColors.greyColor,
                                          ),
                                        ),
                                      );
                                    },
                                  ),

                                  SizedBox(height: 16.h),
                                  AppButtonWidget(
                                    onTap: () {},
                                    btnText: 'Register',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
