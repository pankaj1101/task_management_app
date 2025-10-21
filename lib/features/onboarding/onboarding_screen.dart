import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (_, index) {
          return Container(
            color:
                index == 0
                    ? Colors.red
                    : index == 1
                    ? Colors.green
                    : Colors.yellow,
          );
        },
      ),
    );
  }
}
