import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../routing/driver_routing.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';
import '../../utils/helpers/helper_functions.dart';
import '../driver/general_widgets/outlined_button_widget.dart';
import 'riderOnboarding_page.dart';
import 'rider_dot_navigation.dart';
import 'rider_onboarding_controller.dart';

class RiderOnboardingScreen extends ConsumerStatefulWidget {
  const RiderOnboardingScreen({super.key});

  static const path = '/';
  static const name = 'riderOnboarding';

  @override
  ConsumerState<RiderOnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<RiderOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final pageController = ref.watch(onboardingControllerProvider.select(
      (value) => value.pageController,
    ));
    final controller = ref.read(onboardingControllerProvider.notifier);
    return Scaffold(
      backgroundColor: dark ? TColors.dark : TColors.light,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                children: [
                  // logo
                  Container(
                    alignment: Alignment.center,
                    child: Image(
                      width: 150,
                      height: 100,
                      image: AssetImage(
                        dark ? TImages.darkAppLogo : TImages.driverLogo,
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      onPageChanged: controller.updatePageIndicator,
                      children: const [
                        RiderOnboardingPage(
                          image: TImages.aniOne,
                          title: TTexts.riderOnboardingTitleOne,
                          subTitle: TTexts.riderOnboardingSubTitleOne,
                        ),
                        RiderOnboardingPage(
                          image: TImages.aniThree,
                          title: TTexts.riderOnboardingTitleTwo,
                          subTitle: TTexts.riderOnboardingSubTitleTwo,
                        ),
                        RiderOnboardingPage(
                          image: TImages.aniTwo,
                          title: TTexts.riderOnboardingTitleThree,
                          subTitle: TTexts.riderOnboardingSubTitleThree,
                        ),
                      ],
                    ),
                  ),

                  /// dot navigation
                  const OnboardingDotNavigation(),
                  const SizedBox(
                    height: TSizes.defaultSpace * 2,
                  ),

                  /// Fixed buttons at the bottom
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButtonWidget(
                          onTap: () {
                            context.go(BGRouteNames.driverLogin);
                          },
                          width: double.infinity,
                          buttonOutlineColor:
                              dark ? TColors.grey : TColors.primary,
                          buttonText: TTexts.signIn,
                          buttonTextColor:
                              dark ? TColors.white : TColors.primary,
                        ),
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Expanded(
                        child: SaveButtonWidget(
                          onTap: () {
                            context.go(BGRouteNames.driverSignup);
                          },
                          buttonText: TTexts.createAccount,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
