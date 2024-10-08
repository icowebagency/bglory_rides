import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';

const LatLng currentPosition = LatLng(4.865855964962911, 6.964088436779546);

class RiderSafetyShareTripDetailsScreen extends StatefulWidget {
  const RiderSafetyShareTripDetailsScreen({super.key});

  @override
  State<RiderSafetyShareTripDetailsScreen> createState() =>
      _RiderSafetyShareTripDetailsScreenState();
}

class _RiderSafetyShareTripDetailsScreenState
    extends State<RiderSafetyShareTripDetailsScreen> {
  int currentStep = 0;

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
    final width = MediaQuery.sizeOf(context).width;
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
                  activeBarColor: TColors.primary,
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
                    context.go(BGRiderRouteNames.riderHomeScreen);
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
