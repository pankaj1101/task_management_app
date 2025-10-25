import 'package:flutter/material.dart';
import 'package:task_management_app/widgets/app_bottom_navigation_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification screen')),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 2),
    );
  }
}
