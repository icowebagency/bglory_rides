import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../routing/driver_routing.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';
import '../../utils/helpers/helper_functions.dart';
import 'dot_navigation.dart';
import 'onboarding_controller.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const path = '/';
  static const name = 'onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(OnBoardingController());
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
                      controller: controller.pageController,
                      onPageChanged: controller.updatePageIndicator,
                      children: const [
                        OnboardingPage(
                          image: TImages.aniOne,
                          title: TTexts.onBoardingTitle1,
                          subTitle: TTexts.onBoardingSubTitle1,
                        ),
                        OnboardingPage(
                          image: TImages.aniThree,
                          title: TTexts.onBoardingTitle2,
                          subTitle: TTexts.onBoardingSubTitle2,
                        ),
                        OnboardingPage(
                          image: TImages.aniTwo,
                          title: TTexts.onBoardingTitle3,
                          subTitle: TTexts.onBoardingSubTitle3,
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
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle login button press
                            // Get.off(() => const DriverLoginScreen());

                            context.go(BGRouteNames.driverLogin);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: dark
                                ? TColors.buttonDisabledDark
                                : TColors.white,
                            side: BorderSide(
                                color: dark
                                    ? TColors.buttonDisabledDark
                                    : TColors.darkGrey),
                          ),
                          child: Text(
                            TTexts.signIn,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color: dark
                                        ? TColors.secondary
                                        : TColors.primary),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle signup button press
                            // Get.off(() => const DriverSignup());
                            context.go(BGRouteNames.driverSignup);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                dark ? TColors.secondary : TColors.primary,
                            side: BorderSide(
                              color: dark ? TColors.secondary : TColors.primary,
                            ),
                          ),
                          child: Text(
                            TTexts.createAccount,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color: dark
                                        ? TColors.buttonDisabledDark
                                        : TColors.white),
                          ),
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
