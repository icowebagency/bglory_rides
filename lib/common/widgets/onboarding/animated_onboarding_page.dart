import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TAnimatedOnboardingPage extends StatelessWidget {
  final String lottieAsset;
  final String title;
  final String subtitle;
  final bool isActive;

  const TAnimatedOnboardingPage({
    Key? key,
    required this.lottieAsset,
    required this.title,
    required this.subtitle,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedOpacity(
      opacity: isActive ? 1.0 : 0.8,
      duration: const Duration(milliseconds: 350),
      child: AnimatedScale(
        scale: isActive ? 1.0 : 0.9,
        duration: const Duration(milliseconds: 350),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated container for the Lottie animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              margin: const EdgeInsets.all(10),
              height: 320,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: isDark ? 3 : 0,
                  color: isDark ? TColors.secondary : TColors.white,
                ),
                boxShadow: [
                  if (!isDark)
                    BoxShadow(
                      color: TColors.dark.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: TColors.white,
              ),
              child: Lottie.asset(
                lottieAsset,
                fit: BoxFit.contain,
              ),
            ),

            // Title with animated effect
            const SizedBox(height: TSizes.spaceBtwItems),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 350),
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: isDark ? TColors.white : TColors.black,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            ),

            // Subtitle with animated effect
            const SizedBox(height: TSizes.spaceBtwItems),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 350),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isDark ? TColors.lightGrey : TColors.darkGrey,
              ),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}