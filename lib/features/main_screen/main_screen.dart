import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/core/constants/app_assets.dart';
import 'package:task_management_app/features/calendar/calendar_screen.dart';
import 'package:task_management_app/features/home/home_screen.dart';
import 'package:task_management_app/features/notification/notification_screen.dart';
import 'package:task_management_app/features/profile/profile_screen.dart';
import 'package:task_management_app/widgets/app_bottom_navigation_bar.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  // Dummy pages for demonstration
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    NotificationScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    String dummyImageUrl = AppAssets.dummyPersonImageUrl;

    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: AppBottomNavigationBar(imageUrl: dummyImageUrl),
    );
  }
}
