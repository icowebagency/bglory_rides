import 'package:animated_rating_stars/animated_rating_stars.dart';
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

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  double _currentRating = 2.1;
  int currentStep = 0;
  final int _totalSteps = 3;

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

  /// Controls builder to remove buttons
  Widget controlsBuilder(BuildContext context, ControlsDetails controls) {
    return Container(); // Return an empty container to remove the default buttons
  }

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
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(TTexts.tripHistoryDetailsPassengerReviewTitle,
                    style: Theme.of(context).textTheme.headlineSmall),
                Text(TTexts.tripHistoryDetailsPassengerReviewSubTitle,
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 10),
                Row(
                  children: [
                    AnimatedRatingStars(
                      readOnly: true,
                      starSize: 10,
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
                      animationDuration: const Duration(milliseconds: 500),
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
                    const SizedBox(width: 10),
                    Text(
                      _currentRating.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwSections),
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
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: TColors.error, fontFamily: 'Notosans'),
                    ),
                  ],
                ),
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
                            TTexts.tripHistoryDetailsRideTotalTitle,
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
                                    fontFamily: 'Notosans'),
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
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                TTexts.tripHistoryDetailsInAppPaymentSubTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: 10),
                              ),
                            ],
                          ),
                          Text(
                            TTexts.tripHistoryDetailsInAppPaymentPrice,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
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
                    context.push(BGDriverRouteNames.driverDownloadReceipt);
                  },
                  buttonText: TTexts.tripHistoryDetailsButtonTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
