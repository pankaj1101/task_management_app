import 'package:flutter/material.dart';
import 'package:task_management_app/core/router/routes_names.dart';
import 'package:task_management_app/features/auth/login/login_screen.dart';
import 'package:task_management_app/features/auth/signup/signup_screen.dart';
import 'package:task_management_app/features/onboarding/onboarding_screen.dart';
import 'package:task_management_app/features/splash/splash_screen.dart';

class AppRouter {
  // Route generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesNames.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesNames.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }

  // Optional helper to navigate
  static void push(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static void pushReplacement(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static void pushNamedAndRemoveUntil(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (_) => false);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
