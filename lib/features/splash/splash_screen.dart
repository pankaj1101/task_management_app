import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management_app/core/constants/constants_export.dart';
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

  // Navigate to login or onboarding screen...
  Future<void> _navigateToOnboardingScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final onboardingDone = prefs.getBool('onboarding_completed') ?? false;

    Future.delayed(Duration(seconds: 2)).then((_) {
      if (mounted) {
        AppRouter.pushNamedAndRemoveUntil(
          context,
          onboardingDone ? RoutesNames.login : RoutesNames.onBoarding,
        );
      }
    });
  }
}
