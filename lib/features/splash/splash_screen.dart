import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/core/constants/app_assets.dart';
import 'package:task_management_app/core/constants/app_colors.dart';
import 'package:task_management_app/core/router/app_router.dart';
import 'package:task_management_app/core/router/routes_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboardingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: SvgPicture.asset(AppAssets.appLogo)),
    );
  }

  void _navigateToOnboardingScreen() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      AppRouter.pushNamedAndRemoveUntil(context, RoutesNames.onBoarding);
    });
  }
}
