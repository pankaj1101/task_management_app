import 'package:flutter/material.dart';
import 'package:task_management_app/widgets/app_bottom_navigation_bar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calender Screen')),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 2),
    );
  }
}
