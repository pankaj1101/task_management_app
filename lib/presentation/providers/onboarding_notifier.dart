import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management_app/domain/entities/onboarding_item.dart';
import 'package:task_management_app/data/repositories/onboarding_repository.dart';

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  return const OnboardingRepository();
});

final onboardingNotifierProvider =
    StateNotifierProvider<OnboardingNotifier, int>((ref) {
      return OnboardingNotifier(ref.read(onboardingRepositoryProvider));
    });

class OnboardingNotifier extends StateNotifier<int> {
  final OnboardingRepository repository;

  OnboardingNotifier(this.repository) : super(0);

  List<OnboardingItem> get items => repository.getOnboardingItems();

  void setPage(int index) => state = index;

  void nextPage() {
    if (state < items.length - 1) state++;
  }

  void skipToLast() => state = items.length - 1;

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);
  }
}
