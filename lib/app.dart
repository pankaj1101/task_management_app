import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants/app_colors.dart';
import 'package:task_management_app/core/constants/app_strings.dart';
import 'package:task_management_app/core/router/app_router.dart';
import 'package:task_management_app/core/router/routes_names.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
        primaryColor: AppColors.primaryColor,
      ),
      initialRoute: RoutesNames.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
