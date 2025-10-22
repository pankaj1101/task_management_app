import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/application/onboarding/onboarding_notifier.dart';
import 'package:task_management_app/core/constants/constants_export.dart';
import 'package:task_management_app/core/router/app_router.dart';
import 'package:task_management_app/features/onboarding/components/bottom_section_onboarding_screen.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(onboardingNotifierProvider);
    final controller = ref.read(onboardingNotifierProvider.notifier);
    final items = controller.items;
    final pageController = PageController(initialPage: currentPage);

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        onPageChanged: controller.setPage,
        itemCount: items.length,
        itemBuilder: (_, index) {
          final item = items[index];
          String imagePath = item.imagePath;
          String title = item.title;
          String subTitle = item.subTitle;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset(imagePath, height: 240.h),
              SizedBox(height: 40.h),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.r,
                  color: AppColors.primaryTextColor,
                ),
              ),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.r,
                  color: AppColors.neutralSecondaryColor,
                ),
              ),
              Spacer(),

              // Bottom section Onboarding screen...
              BottomSectionOnboardingScreen(
                onSkip: () {
                  controller.skipToLast();
                  pageController.jumpToPage(items.length - 1);
                },
                onNext: () async {
                  if (currentPage == items.length - 1) {
                    // Last page reached → complete onboarding
                    await controller.completeOnboarding();
                    if (context.mounted) {
                      AppRouter.pushNamedAndRemoveUntil(
                        context,
                        '/login',
                      ); // Navigate to login
                    }
                  } else {
                    controller.nextPage();
                    pageController.animateToPage(
                      ref.read(onboardingNotifierProvider),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                currentPage: currentPage,
                totalPages: items.length,
              ),
            ],
          );
        },
      ),
    );
  }
}
