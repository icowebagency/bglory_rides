import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/features/driver/general_widgets/outlined_button_widget.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/text_strings.dart';

class GetADriverScreen extends StatefulWidget {
  const GetADriverScreen({super.key});

  @override
  State<GetADriverScreen> createState() => _GetADriverScreenState();
}

class _GetADriverScreenState extends State<GetADriverScreen> {
  List<StepperData> stepperData = [
    StepperData(
      iconWidget: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: TColors.primary,
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
      // subtitle: StepperText(
      //   TTexts.driverTripInvoiceTimeSubTitle,
      // ),
      title: StepperText(
        TTexts.rideHailingLocation,
        // textStyle: Theme.of(context).textTheme.labelLarge
      ),
    ),
    StepperData(
      iconWidget: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: TColors.grey,
            width: 1.3,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: TColors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
      // subtitle: StepperText(
      //   TTexts.driverTripInvoiceTimeSubTitleTwo,
      // ),
      title: StepperText(
        TTexts.rideHailingDestination,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: TColors.accent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Iconsax.car,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        TTexts.riderGetADriverBottomSheetRiderTypeTitle,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: TColors.primary,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        TTexts.nairaSymbol,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: TColors.primary,
                              fontFamily: 'Notosans',
                            ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        TTexts.riderHomeScreenChooseRidePremiumPriceTitle,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: TColors.primary,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            //Ride Timeline
            AnotherStepper(
              activeBarColor: TColors.grey,
              activeIndex: 0,
              barThickness: 1,
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
              inActiveBarColor: TColors.grey,
              verticalGap: 15,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Iconsax.money_4,
                        size: 17,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        TTexts.riderPaymentTypeBottomSheetDebitTitle,
                          style: Theme.of(context).textTheme.labelMedium
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.routing,
                        size: 17,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        TTexts.riderGetADriverBottomSheetRiderTripDistanceTitle,
                          style: Theme.of(context).textTheme.labelMedium
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.clock,
                        size: 17,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        TTexts.riderGetADriverBottomSheetRiderTripTimeTitle,
                        style: Theme.of(context).textTheme.labelMedium
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SaveButtonWidget(
              onTap: () {},
              buttonTextColor: TColors.white,
              buttonText: TTexts.riderGetADriverBottomSheetRiderGetADriverTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButtonWidget(
              onTap: () {},
              buttonText: TTexts.driverChangePaymentBottomSheetCancelButtonText,
              buttonTextColor: TColors.dark,
              buttonOutlineColor: TColors.dark,
            ),
          ],
        ),
      ),
    );
  }
}
