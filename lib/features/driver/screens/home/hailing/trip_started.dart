import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:bglory_rides/features/driver/general-widgets/outlined_button_widget.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../common/distance_animation/car_animation_screen.dart';

class TripStarted extends StatefulWidget {
  const TripStarted({super.key});

  @override
  State<TripStarted> createState() => _TripStartedState();
}

class _TripStartedState extends State<TripStarted> {
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

  Future<void> _showPopupDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button to close
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: TColors.dragableBottomSheetColor,
          content: SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TTexts.receiptSentTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    TTexts.receiptSentSubTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // driver details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: TColors.white,
                      backgroundImage: AssetImage(
                        TImages.user,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TTexts.pickupBottomSheetDriverName,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 20),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.star,
                                color: TColors.warning, size: 20),
                            const SizedBox(width: 5),
                            Text(TTexts.pickupBottomSheetDriverRating,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // contact buttons row
                Text(
                  TTexts.startTripAmount,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 25,
                        color: TColors.primary,
                        fontFamily: 'Notosans',
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ],
            ),

            // driver animation
            const CarAnimationScreen(),
            // timeline
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
            // driver pickup dynamic time
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TTexts.startTripDestinationTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 15),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(TTexts.startTripTime),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            // driver pickup button
            // SaveButtonWidget(
            //   onTap: () {
            //     Navigator.pop(context);
            //     // showModalBottomSheet(
            //     //   // constraints: BoxConstraints.tight(
            //     //   //   Size.fromHeight(height * 0.4),
            //     //   // ),
            //     //   isScrollControlled: false,
            //     //   context: context,
            //     //   builder: (BuildContext context) {
            //     //     return const GoToPickupBottomSheetScreen();
            //     //   },
            //     // );
            //   },
            //   buttonText: TTexts.pickupBottomSheetDriverButton,
            // )
            OutlinedButtonWidget(
              onTap: () {
                Navigator.pop(context);
                // showModalBottomSheet(
                //   constraints: BoxConstraints.tight(
                //     Size.fromHeight(height * 0.5),
                //   ),
                //   isScrollControlled: false,
                //   context: context,
                //   builder: (BuildContext context) {
                //     return const TripCompleted();
                //   },
                // );
                _showPopupDialog(context);
              },
              buttonText: TTexts.tripStartedCancelRideButton,
              buttonTextColor: TColors.primary,
              buttonOutlineColor: TColors.primary,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            OutlinedButtonWidget(
              onTap: () {},
              buttonText: TTexts.tripStartedEmergencyButton,
              buttonTextColor: TColors.error,
              buttonOutlineColor: TColors.error,
            ),
          ],
        ),
      ),
    );
  }
}
