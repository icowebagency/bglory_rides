import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/distance_animation/car_animation_screen.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class TripCompletedBottomSheet extends StatefulWidget {
  const TripCompletedBottomSheet({super.key});

  @override
  State<TripCompletedBottomSheet> createState() =>
      _TripCompletedBottomSheetState();
}

class _TripCompletedBottomSheetState extends State<TripCompletedBottomSheet> {
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.riderDriverFoundBottomSheetStartTripCompletedTitle,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
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
          Text(
            TTexts.riderDriverFoundBottomSheetTripCompletedArrivalTimeTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SaveButtonWidget(
            onTap: () {},
            buttonText: TTexts
                .riderDriverFoundBottomSheetStartTripCompletedInvoiceTitle,
          ),
        ],
      ),
    );
  }
}
