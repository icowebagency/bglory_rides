import 'package:bglory_rides/features/driver/screens/home/home-drawer/trip_history/trip_history_widget.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/constants/text_strings.dart';

class TripHistoryScreen extends StatefulWidget {
  const TripHistoryScreen({super.key});

  @override
  State<TripHistoryScreen> createState() => _TripHistoryScreenState();
}

class _TripHistoryScreenState extends State<TripHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          TTexts.blankTripHistoryAppBarTitle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTexts.tripsHistoryMonthDateTwo,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Container(
                  width: width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      TripHistoryWidget(
                        onTap: () {
                          context.push(BGRouteNames.driverTripHistoryDetails);
                        },
                        tripTitle: TTexts.tripsHistoryLocationTitle,
                        tripLocation: TTexts.tripsHistoryLocation,
                        tripPrice: TTexts.tripsHistoryFee,
                        tripDate: TTexts.tripsHistoryDate,
                      ),
                      TripHistoryWidget(
                        onTap: () {},
                        tripTitle: TTexts.tripsHistoryLocationTitleOne,
                        tripLocation: TTexts.tripsHistoryLocationOne,
                        tripPrice: TTexts.tripsHistoryFeeOne,
                        tripDate: TTexts.tripsHistoryDateOne,
                      ),
                      const TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitle,
                        tripLocation: TTexts.tripsHistoryLocation,
                        tripPrice: TTexts.tripsHistoryFee,
                        tripDate: TTexts.tripsHistoryDate,
                      ),
                      const TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitleOne,
                        tripLocation: TTexts.tripsHistoryLocationOne,
                        tripPrice: TTexts.tripsHistoryFeeOne,
                        tripDate: TTexts.tripsHistoryDateOne,
                      ),
                      const TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitle,
                        tripLocation: TTexts.tripsHistoryLocation,
                        tripPrice: TTexts.tripsHistoryFee,
                        tripDate: TTexts.tripsHistoryDate,
                      ),
                      const TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitleOne,
                        tripLocation: TTexts.tripsHistoryLocationOne,
                        tripPrice: TTexts.tripsHistoryFeeOne,
                        tripDate: TTexts.tripsHistoryDateOne,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  TTexts.tripsHistoryMonthDateOne,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Container(
                  width: width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    children: [
                      TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitle,
                        tripLocation: TTexts.tripsHistoryLocation,
                        tripPrice: TTexts.tripsHistoryFee,
                        tripDate: TTexts.tripsHistoryDate,
                      ),
                      TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitleOne,
                        tripLocation: TTexts.tripsHistoryLocationOne,
                        tripPrice: TTexts.tripsHistoryFeeOne,
                        tripDate: TTexts.tripsHistoryDateOne,
                      ),
                      TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitle,
                        tripLocation: TTexts.tripsHistoryLocation,
                        tripPrice: TTexts.tripsHistoryFee,
                        tripDate: TTexts.tripsHistoryDate,
                      ),
                      TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitleOne,
                        tripLocation: TTexts.tripsHistoryLocationOne,
                        tripPrice: TTexts.tripsHistoryFeeOne,
                        tripDate: TTexts.tripsHistoryDateOne,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  TTexts.tripsHistoryMonthDate,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Container(
                  width: width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    children: [
                      TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitle,
                        tripLocation: TTexts.tripsHistoryLocation,
                        tripPrice: TTexts.tripsHistoryFee,
                        tripDate: TTexts.tripsHistoryDate,
                      ),
                      TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitleOne,
                        tripLocation: TTexts.tripsHistoryLocationOne,
                        tripPrice: TTexts.tripsHistoryFeeOne,
                        tripDate: TTexts.tripsHistoryDateOne,
                      ),
                      TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitle,
                        tripLocation: TTexts.tripsHistoryLocation,
                        tripPrice: TTexts.tripsHistoryFee,
                        tripDate: TTexts.tripsHistoryDate,
                      ),
                      TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitleOne,
                        tripLocation: TTexts.tripsHistoryLocationOne,
                        tripPrice: TTexts.tripsHistoryFeeOne,
                        tripDate: TTexts.tripsHistoryDateOne,
                      ),
                      TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitle,
                        tripLocation: TTexts.tripsHistoryLocation,
                        tripPrice: TTexts.tripsHistoryFee,
                        tripDate: TTexts.tripsHistoryDate,
                      ),
                      TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitleOne,
                        tripLocation: TTexts.tripsHistoryLocationOne,
                        tripPrice: TTexts.tripsHistoryFeeOne,
                        tripDate: TTexts.tripsHistoryDateOne,
                      ),
                      TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitle,
                        tripLocation: TTexts.tripsHistoryLocation,
                        tripPrice: TTexts.tripsHistoryFee,
                        tripDate: TTexts.tripsHistoryDate,
                      ),
                      TripHistoryWidget(
                        tripTitle: TTexts.tripsHistoryLocationTitleOne,
                        tripLocation: TTexts.tripsHistoryLocationOne,
                        tripPrice: TTexts.tripsHistoryFeeOne,
                        tripDate: TTexts.tripsHistoryDateOne,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
