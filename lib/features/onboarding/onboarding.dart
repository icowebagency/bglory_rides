import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/widgets/onboarding/onboarding_screen.dart';
import '../../routing/driver_routing.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/text_strings.dart';
import '../../utils/helpers/helper_functions.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const path = '/';
  static const name = 'onboarding';

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    final pages = [
      const OnboardingPage(
        image: TImages.aniOne,
        title: TTexts.onBoardingTitle1,
        subtitle: TTexts.onBoardingSubTitle1,
      ),
      const OnboardingPage(
        image: TImages.aniThree,
        title: TTexts.onBoardingTitle2,
        subtitle: TTexts.onBoardingSubTitle2,
      ),
      const OnboardingPage(
        image: TImages.aniTwo,
        title: TTexts.onBoardingTitle3,
        subtitle: TTexts.onBoardingSubTitle3,
      ),
    ];

    return TOnboardingScreen(
      logoAsset: isDark ? TImages.darkAppLogo : TImages.lightAppLogo,
      pages: pages,
      onSignInPressed: () => context.go(BGDriverRouteNames.driverLogin),
      onSignUpPressed: () => context.go(BGDriverRouteNames.driverSignup),
    );
  }
}