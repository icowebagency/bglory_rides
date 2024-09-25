import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';

const LatLng currentPosition = LatLng(4.865855964962911, 6.964088436779546);

class SafetyShareTripDetailsScreen extends StatefulWidget {
  const SafetyShareTripDetailsScreen({super.key});

  @override
  State<SafetyShareTripDetailsScreen> createState() =>
      _SafetyShareTripDetailsScreenState();
}

class _SafetyShareTripDetailsScreenState
    extends State<SafetyShareTripDetailsScreen> {
  final double _currentRating = 2.1;
  int currentStep = 0;
  final int _totalSteps = 3;

  /// cancel step function
  void cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1;
      });
    }
  }

  /// continue step function
  void continueStep() {
    if (currentStep < _totalSteps - 1) {
      setState(() {
        currentStep = currentStep + 1;
      });
    }
  }

  /// OnStep Tapped function
  void onStepTapped(int value) {
    if (value > currentStep) {
      continueStep();
    } else if (value < currentStep) {
      cancelStep();
    }
  }

  /// Controls builder to remove buttons
  Widget controlsBuilder(BuildContext context, ControlsDetails controls) {
    return Container(); // Return an empty container to remove the default buttons
  }

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTexts.tripHistoryDetailsAppBarTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Iconsax.calendar,
                      size: 18,
                    ),
                    Text(
                      TTexts.tripHistoryDetailsDate,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Icon(
                      Iconsax.car,
                      size: 18,
                    ),
                    const Text(TTexts.tripHistoryDetailsKilometer),
                    const Icon(
                      Iconsax.clock,
                      size: 18,
                    ),
                    const Text(TTexts.tripHistoryDetailsTime),
                  ],
                ),
                // Start timeline
                AnotherStepper(
                  verticalGap: 20,
                  activeBarColor: TColors.grey,
                  activeIndex: 1,
                  stepperList: stepperData,
                  stepperDirection: Axis.vertical,
                  inActiveBarColor: TColors.grey,
                ),

                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: width,
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            TTexts.driverTripFareTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: TColors.success),
                          ),
                          Text(
                            TTexts.tripHistoryDetailsRideTotalAmount,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: TColors.success,
                                  fontFamily: 'Notosans',
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  TTexts.driverTripDetailsVehicleDetailsTitle,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: TColors.grey,
                      ),
                ),
                Text(TTexts.driverTripDetailsVehicleDetails,
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: TSizes.spaceBtwItems),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  TTexts.driverTripDetailsPassengerTitle,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: TColors.grey,
                      ),
                ),
                Text(TTexts.driverTripDetailsPassengerDetails,
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: TSizes.spaceBtwItems),
                SaveButtonWidget(
                  onTap: () {
                    context.go(BGDriverRouteNames.driverHomePageScreen);
                  },
                  buttonText: TTexts.driverTripDetailsButtonText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
