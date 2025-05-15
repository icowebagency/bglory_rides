import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/widgets/onboarding/onboarding_screen.dart';
import '../../routing/rider_routing.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/text_strings.dart';
import '../../utils/helpers/helper_functions.dart';

class RiderOnboardingScreen extends StatelessWidget {
  const RiderOnboardingScreen({super.key});

  static const path = '/';
  static const name = 'riderOnboarding';

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    final pages = [
      const OnboardingPage(
        image: TImages.aniOne,
        title: TTexts.riderOnboardingTitleOne,
        subtitle: TTexts.riderOnboardingSubTitleOne,
      ),
      const OnboardingPage(
        image: TImages.aniThree,
        title: TTexts.riderOnboardingTitleTwo,
        subtitle: TTexts.riderOnboardingSubTitleTwo,
      ),
      const OnboardingPage(
        image: TImages.aniTwo,
        title: TTexts.riderOnboardingTitleThree,
        subtitle: TTexts.riderOnboardingSubTitleThree,
      ),
    ];

    return TOnboardingScreen(
      logoAsset: isDark ? TImages.darkAppLogo : TImages.lightAppLogo,
      pages: pages,
      onSignInPressed: () => context.go(BGRiderRouteNames.riderLogin),
      onSignUpPressed: () => context.go(BGRiderRouteNames.riderSignup),
    );
  }
}