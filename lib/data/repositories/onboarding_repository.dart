import 'package:task_management_app/domain/entities/onboarding_item.dart';

class OnboardingRepository {
  const OnboardingRepository();

  List<OnboardingItem> getOnboardingItems() {
    return const [
      OnboardingItem(
        imagePath: "assets/images/onboarding1.png",
        title: "📌Stay Organized & Focused",
        subTitle:
            "Easily create, manage, and prioritize your\ntasks to stay on top of your day.",
      ),
      OnboardingItem(
        imagePath: "assets/images/onboarding2.png",
        title: "⏳ Never Miss a Deadline",
        subTitle:
            "Set reminders and due dates to keep track\nof important tasks effortlessly.",
      ),
      OnboardingItem(
        imagePath: "assets/images/onboarding3.png",
        title: "✅ Boost Productivity",
        subTitle:
            "Break tasks into steps, track progress, and\nget more done with ease.",
      ),
    ];
  }
}
