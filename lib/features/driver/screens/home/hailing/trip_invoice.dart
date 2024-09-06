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

import '../../../../../utils/constants/colors.dart';

const LatLng currentPosition = LatLng(4.865855964962911, 6.964088436779546);

class TripInvoiceScreen extends StatefulWidget {
  const TripInvoiceScreen({super.key});

  @override
  State<TripInvoiceScreen> createState() => _TripInvoiceScreenState();
}

class _TripInvoiceScreenState extends State<TripInvoiceScreen> {
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
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          TTexts.driverTripInvoiceAppBarTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Center(
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // trip date
                    Row(
                      children: [
                        const Icon(
                          Iconsax.calendar,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          TTexts.driverTripInvoiceDate,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    // trip distance
                    Row(
                      children: [
                        const Icon(
                          Iconsax.car,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          TTexts.driverTripInvoiceDistance,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.clock,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          TTexts.driverTripInvoiceTripTime,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            //Ride Timeline
            AnotherStepper(
              verticalGap: 20,
              activeBarColor: TColors.primary,
              activeIndex: 0,
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
              inActiveBarColor: TColors.grey,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              height: height * 0.26,
              width: width,
              child: const GoogleMap(
                zoomGesturesEnabled: true,
                mapType: MapType.terrain,
                initialCameraPosition: CameraPosition(
                  zoom: 13,
                  target: currentPosition,
                ),
              ),
            ),
            Text(TTexts.tripHistoryDetailsPaymentDetailsTitle,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(TTexts.tripHistoryDetailsRideFareTitle,
                    style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  TTexts.tripHistoryDetailsRideFarePrice,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontFamily: 'Notosans',
                      ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(TTexts.tripHistoryDetailsBookingFeeTitle,
                    style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  TTexts.tripHistoryDetailsBookingFeePrice,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontFamily: 'Notosans',
                      ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TTexts.tripHistoryDetailsDiscountTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: TColors.error),
                ),
                Text(
                  TTexts.tripHistoryDetailsDiscountPrice,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: TColors.error, fontFamily: 'Notosans'),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        TTexts.tripHistoryDetailsRideTotalTitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: TColors.success),
                      ),
                      Text(
                        TTexts.tripHistoryDetailsRideTotalAmount,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: TColors.success, fontFamily: 'Notosans'),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(TTexts.tripHistoryDetailsInAppPaymentTitle,
                              style: Theme.of(context).textTheme.titleLarge),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            TTexts.tripHistoryDetailsInAppPaymentSubTitle,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 10,
                                      color: TColors.grey,
                                    ),
                          ),
                        ],
                      ),
                      Text(
                        TTexts.tripHistoryDetailsInAppPaymentPrice,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontFamily: 'Notosans',
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
            SaveButtonWidget(
              onTap: () {
                context.go(BGRouteNames.driverPassengerRatingScreen);
              },
              buttonText: TTexts.driverTripInvoiceButton,
            )
          ],
        ),
      ),
    );
  }
}
