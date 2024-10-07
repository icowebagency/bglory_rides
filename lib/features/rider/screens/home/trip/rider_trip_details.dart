import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/features/rider/screens/home/bottomSheets_screens/confirmation_pin.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

const LatLng currentPosition = LatLng(4.865855964962911, 6.964088436779546);

class RiderTripDetailsScreen extends StatefulWidget {
  const RiderTripDetailsScreen({super.key});

  @override
  State<RiderTripDetailsScreen> createState() => _RiderTripDetailsScreenState();
}

class _RiderTripDetailsScreenState extends State<RiderTripDetailsScreen> {
  double _currentRating = 2.1;
  int currentStep = 0;
  final int _totalSteps = 3;
// A set to keep track of selected value,
  int? selectedCardIndex;
  // Define a list of logos
  final List<String> cardLogos = [
    TImages.masterCard, // Replace with the actual logo paths
    TImages.visaCard, // Replace with the actual logo paths
  ];
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
    final height = MediaQuery.sizeOf(context).height;
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

                /// Driver Profile
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: TColors.grey.withOpacity(0.2),
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
                                      TTexts
                                          .riderDriverFoundBottomSheetDriverName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
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
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      TTexts
                                          .riderDriverFoundBottomSheetDriverCarPlatNumber,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
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
                      ],
                    ),
                  ),
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
                              Text(
                                TTexts.riderPaymentTypeBottomSheetDebitTitle,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                TTexts.tripHistoryDetailsPaymentSubTitle,
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
                const Divider(),

                /// Card details
                Text(
                  TTexts.riderTripInAppPaymentCashTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                Column(
                  children: List.generate(2, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            // Update the selected card index when a card is tapped.
                            selectedCardIndex = index;
                          },
                        );
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10), // Add some margin
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20), // Add padding inside the container
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectedCardIndex == index
                                ? TColors.primary
                                : TColors.grey,
                          ),
                          color: selectedCardIndex == index
                              ? TColors.primary
                                  .withOpacity(0.1) // Change color if selected
                              : TColors.white, // Default color
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio<int>(
                                  activeColor: selectedCardIndex == index
                                      ? TColors.primary
                                      : TColors.grey,
                                  value: index,
                                  groupValue:
                                      selectedCardIndex, // Bind to the selected index
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCardIndex = value;
                                    });
                                  },
                                ),
                                Text(
                                  TTexts.riderTripInAppPaymentCardDetailsTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ],
                            ),
                            Image(
                              height: 20,
                              image: AssetImage(
                                cardLogos[index],
                              ),
                            ), // Replace with your image
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SaveButtonWidget(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: false,
                      context: context,
                      builder: (BuildContext context) {
                        return const RiderConfirmationPinScreen();
                      },
                    );
                  },
                  buttonText: TTexts.riderInvoiceButtonTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
