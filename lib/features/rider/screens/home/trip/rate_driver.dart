import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../utils/constants/text_strings.dart';

class RateDriverScreen extends StatefulWidget {
  const RateDriverScreen({super.key});

  @override
  State<RateDriverScreen> createState() => _RateDriverScreenState();
}

class _RateDriverScreenState extends State<RateDriverScreen> {
  double _currentRating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TTexts.riderRateDriverTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        TImages.riderUser,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  TTexts.riderRateDriverNameTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TTexts.riderDriverFoundBottomSheetDriverCarName,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Text(
                      TTexts.riderDriverFoundBottomSheetDriverCarPlatNumber,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        TTexts.riderRatingTitle,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      AnimatedRatingStars(
                        readOnly: true,
                        starSize: 30,
                        displayRatingValue: true,
                        minRating: 0.0,
                        maxRating: 5.0,
                        emptyColor: Colors.grey,
                        interactiveTooltips: true,
                        filledIcon: Icons.star,
                        filledColor: TColors.warning,
                        emptyIcon: Icons.star_outlined,
                        halfFilledIcon: Icons.star_half,
                        animationCurve: Curves.easeInOut,
                        animationDuration: const Duration(
                          milliseconds: 500,
                        ),
                        initialRating: 3.5,
                        onChanged: (rating) {
                          setState(() {
                            _currentRating = rating;
                          });
                        },
                        customFilledIcon: Icons.star,
                        customEmptyIcon: Icons.star_outline,
                        customHalfFilledIcon: Icons.star_half,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Column(
                  children: [
                    Text(
                      TTexts.riderRateDriverAdditionalCommentTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: TTexts.riderRateDriverAdditionalCommentTitle,
                        labelStyle: Theme.of(context).textTheme.bodySmall,
                        filled: true,
                        fillColor:
                            TColors.containerBackgroundColor.withOpacity(0.6),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TColors.primary,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: TColors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections * 2),
                SaveButtonWidget(
                  onTap: () {
                    _feedBackPopUpDialog(context);
                  },
                  buttonText: TTexts.submit,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Feedback Dialog

void _feedBackPopUpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Lottie.asset(
                  fit: BoxFit.cover,
                  TImages.successVerification,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                TTexts.riderRatingFeedbackTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SaveButtonWidget(
                onTap: () {
                  context.go(BGRiderRouteNames.riderHomeScreen);
                },
                buttonText: TTexts.riderRatingFeedbackButtonTitle,
                buttonColor: TColors.success,
              ),
            ],
          ),
        ),
      );
    },
  );
}
