import 'package:another_stepper/another_stepper.dart';
import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/features/driver/general-widgets/outlined_button_widget.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HailingBottomSheet extends StatefulWidget {
  const HailingBottomSheet({super.key});

  @override
  State<HailingBottomSheet> createState() => _HailingBottomSheetState();
}

class _HailingBottomSheetState extends State<HailingBottomSheet> {
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        TTexts.rideHailingLocation,
      ),
    ),
    StepperData(
      title: StepperText(
        TTexts.rideHailingDestination,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Iconsax.money_4,
                      color: TColors.primary,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      TTexts.rideHailingPriceTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: TColors.primary, fontFamily: 'Notosans'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Iconsax.routing,
                      color: TColors.primary,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      TTexts.rideHailingDistanceTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: TColors.primary, fontFamily: 'Notosans'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Iconsax.clock,
                      color: TColors.primary,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      TTexts.rideHailingTimeTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: TColors.primary, fontFamily: 'Notosans'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            //Ride Timeline
            AnotherStepper(
              verticalGap: 20,
              activeBarColor: TColors.grey,
              activeIndex: 0,
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
              inActiveBarColor: TColors.grey,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
// Row for payment type
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Premium ride
                Row(
                  children: [
                    const Icon(Iconsax.car, color: TColors.darkGrey, size: 20),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      TTexts.rideHailingStandardTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),

                // Cash payment
                Row(
                  children: [
                    const Icon(Iconsax.money_4,
                        color: TColors.darkGrey, size: 20),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      TTexts.rideHailingPaymentTypeTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SaveButtonWidget(
              onTap: () {},
              buttonText: TTexts.rideHailingAcceptButton,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            OutlinedButtonWidget(
              buttonOutlineColor: TColors.error,
              onTap: () {},
              buttonText: TTexts.rideHailingCancelButton,
              buttonTextColor: TColors.error,
            )
          ],
        ),
      ),
    );
  }
}
