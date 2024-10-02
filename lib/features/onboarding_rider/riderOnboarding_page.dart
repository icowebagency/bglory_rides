import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class RiderOnboardingPage extends StatelessWidget {
  const RiderOnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// slide image
        Container(
          margin: const EdgeInsets.all(10),
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                width: dark ? 3 : 0,
                color: dark ? TColors.primary : TColors.white,
              ),
              borderRadius: BorderRadius.circular(20),
              color: TColors.white),
          child: Lottie.asset(image),
        ),
        // Text for onboarding
        const SizedBox(
          height: TSizes.defaultSpace,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: dark ? TColors.white : TColors.black),
          textAlign: TextAlign.center,
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text(
          subTitle,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: dark ? TColors.grey : TColors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.defaultSpace,
        ),
      ],
    );
  }
}
