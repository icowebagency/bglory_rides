import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../buttons/button.dart';
import 'animated_onboarding_page.dart';
import 'dot_indicator.dart';

// Provider to manage onboarding state
final onboardingProvider = StateNotifierProvider.autoDispose<OnboardingNotifier, OnboardingState>((ref) {
  return OnboardingNotifier();
});

// State class
class OnboardingState {
  final PageController pageController;
  final int currentPage;

  OnboardingState({
    required this.pageController,
    required this.currentPage,
  });

  OnboardingState copyWith({
    PageController? pageController,
    int? currentPage,
  }) {
    return OnboardingState(
      pageController: pageController ?? this.pageController,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

// State notifier
class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(OnboardingState(
    pageController: PageController(),
    currentPage: 0,
  ));

  void updatePage(int page) {
    state = state.copyWith(currentPage: page);
  }

  void jumpToPage(int page) {
    state.pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void next() {
    final nextPage = state.currentPage + 1;
    if (nextPage < 3) {
      jumpToPage(nextPage);
    }
  }

  void skip() {
    jumpToPage(2);
  }
}

// Helper class for page data
class OnboardingPage {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

// Onboarding screen
class TOnboardingScreen extends ConsumerWidget {
  final String logoAsset;
  final List<OnboardingPage> pages;
  final VoidCallback onSignInPressed;
  final VoidCallback onSignUpPressed;

  const TOnboardingScreen({
    Key? key,
    required this.logoAsset,
    required this.pages,
    required this.onSignInPressed,
    required this.onSignUpPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? TColors.dark : TColors.light,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace,
            vertical: TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              // Top section with logo and skip button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  Image(
                    width: 120,
                    height: 80,
                    image: AssetImage(logoAsset),
                  ),

                  // Skip button (only show on first two pages)
                  if (state.currentPage < 2)
                    TButton(
                      text: "Skip",
                      style: TButtonStyle.text,
                      onPressed: notifier.skip,
                      isFullWidth: false,
                      foregroundColor: isDark ? TColors.secondary : TColors.primary,
                    ),
                ],
              ),

              // Page view with animated transitions
              Expanded(
                child: PageView.builder(
                  controller: state.pageController,
                  onPageChanged: notifier.updatePage,
                  itemCount: pages.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return TAnimatedOnboardingPage(
                      lottieAsset: page.image,
                      title: page.title,
                      subtitle: page.subtitle,
                      isActive: index == state.currentPage,
                    );
                  },
                ),
              ),

              // Dots and navigation buttons
              Column(
                children: [
                  // Dot indicator
                  TDotIndicator(
                    pageController: state.pageController,
                    count: 3,
                    onDotClicked: notifier.jumpToPage,
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Show "Next" button on first two pages, action buttons on last page
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: state.currentPage < 2
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: TButton(
                      text: "Next",
                      onPressed: notifier.next,
                      style: TButtonStyle.primary,
                      backgroundColor: isDark ? TColors.secondary : TColors.primary,
                    ),
                    secondChild: Row(
                      children: [
                        // Sign In button
                        Expanded(
                          child: TButton(
                            text: "Sign In",
                            style: TButtonStyle.outlined,
                            onPressed: onSignInPressed,
                            foregroundColor: isDark ? TColors.secondary : TColors.primary,
                            borderColor: isDark ? TColors.secondary : TColors.primary,
                          ),
                        ),

                        const SizedBox(width: TSizes.spaceBtwItems),

                        // Sign Up button
                        Expanded(
                          child: TButton(
                            text: "Sign Up",
                            style: TButtonStyle.primary,
                            onPressed: onSignUpPressed,
                            backgroundColor: isDark ? TColors.secondary : TColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}