import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:bglory_rides/features/driver/general_widgets/outlined_button_widget.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/distance_animation/car_animation_screen.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';

class StartTripDetailsBottomSheet extends StatefulWidget {
  const StartTripDetailsBottomSheet({super.key});

  @override
  State<StartTripDetailsBottomSheet> createState() =>
      _StartTripDetailsBottomSheetState();
}

class _StartTripDetailsBottomSheetState
    extends State<StartTripDetailsBottomSheet> {
  List<StepperData> stepperData = [
    StepperData(
      iconWidget: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: TColors.secondary,
            width: 1.3,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: TColors.secondary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
      subtitle: StepperText(
        TTexts.driverTripInvoiceTimeSubTitle,
      ),
      title: StepperText(
        TTexts.rideHailingLocation,
      ),
    ),
    StepperData(
      iconWidget: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: TColors.secondary,
            width: 1.3,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: TColors.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
      subtitle: StepperText(
        TTexts.driverTripInvoiceTimeSubTitleTwo,
      ),
      title: StepperText(
        TTexts.rideHailingDestination,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: TColors.accent.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: FittedBox(
                child: Row(
                  children: [
                    // user image and details
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: TColors.dark),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(TImages.riderUser),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  TTexts.riderDriverFoundBottomSheetDriverName,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: TColors.warning,
                                      size: 15,
                                    ),
                                    Text(
                                      TTexts
                                          .riderDriverFoundBottomSheetDriverRating,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  TTexts
                                      .riderDriverFoundBottomSheetDriverCarName,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  TTexts
                                      .riderDriverFoundBottomSheetDriverCarPlatNumber,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    /// Price
                    Row(
                      children: [
                        Text(
                          TTexts.nairaSymbol,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: TColors.primary,
                                    fontFamily: 'Notosans',
                                  ),
                        ),
                        Text(
                          TTexts.riderHomeScreenChooseRidePremiumPriceTitle,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: TColors.primary,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const CarAnimationScreen(),
            //Ride Timeline
            AnotherStepper(
              activeBarColor: TColors.primary,
              activeIndex: 1,
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
              inActiveBarColor: TColors.grey,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TTexts.riderDriverFoundBottomSheetStartTripArrivalTimeTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  TTexts
                      .riderDriverFoundBottomSheetStartTripArrivalTimeCountingTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: TColors.primary),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            OutlinedButtonWidget(
              onTap: () {},
              buttonText: TTexts.driverCancelRide,
              buttonOutlineColor: TColors.warning,
              buttonTextColor: TColors.warning,
            ),
            const SizedBox(
              height: 13,
            ),
            OutlinedButtonWidget(
              onTap: () {},
              buttonTextColor: TColors.error,
              buttonOutlineColor: TColors.error,
              buttonText: TTexts.tripStartedEmergencyButton,
            ),
          ],
        ),
      ),
    );
  }
}
