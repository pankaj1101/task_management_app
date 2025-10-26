import 'package:flutter/material.dart';
import 'package:task_management_app/core/router/routes_names.dart';
import 'package:task_management_app/presentation/pages/auth/login/login_screen.dart';
import 'package:task_management_app/presentation/pages/auth/signup/signup_screen.dart';
import 'package:task_management_app/presentation/pages/calendar/calendar_screen.dart';
import 'package:task_management_app/presentation/pages/home/home_screen.dart';
import 'package:task_management_app/presentation/pages/main_screen/main_screen.dart';
import 'package:task_management_app/presentation/pages/notification/notification_screen.dart';
import 'package:task_management_app/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:task_management_app/presentation/pages/profile/profile_screen.dart';
import 'package:task_management_app/presentation/pages/splash/splash_screen.dart';

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
      case RoutesNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesNames.notification:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case RoutesNames.calender:
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
      case RoutesNames.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case RoutesNames.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());

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
