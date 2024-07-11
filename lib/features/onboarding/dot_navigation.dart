import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'onboarding_controller.dart';

class OnboardingDotNavigation extends ConsumerWidget {
  const OnboardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(onboardingControllerProvider.select(
      (value) => value.pageController,
    ));
    final onBoardingController =
        ref.read(onboardingControllerProvider.notifier);
    final dark = THelperFunctions.isDarkMode(context);
    return SmoothPageIndicator(
      controller: pageController,
      onDotClicked: onBoardingController.dotNavigationClick,
      count: 3,
      effect: ExpandingDotsEffect(
        activeDotColor: dark ? TColors.secondary : TColors.primary,
        dotColor: TColors.buttonDisabled,
        dotHeight: 6,
        dotWidth: 5,
      ),
    );
  }
}
