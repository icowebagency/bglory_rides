import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:bglory_rides/features/driver/screens/home/provider/home_provider.dart';
import 'package:bglory_rides/features/driver/screens/home/widgets/driver_box_widget.dart';
import 'package:bglory_rides/features/driver/screens/home/widgets/map_custom_icon_widget.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vibration/vibration.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import 'hailing/hailing_bottom_sheet.dart';

const LatLng currentPosition = LatLng(4.873944125830453, 6.968284104088095);

class DriverHomePageScreen extends ConsumerStatefulWidget {
  const DriverHomePageScreen({super.key});

  @override
  ConsumerState<DriverHomePageScreen> createState() =>
      _DriverHomePageScreenState();
}

class _DriverHomePageScreenState extends ConsumerState<DriverHomePageScreen> {
// initial rating value
  // Global key to control the scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _currentRating = 2.1;
  bool status = false;

  @override
  void initState() {
    ref.read(driverHomeDataNotifierProvider.notifier).loadHomePageData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    double width = size.width;
    double height = size.height;
    return Scaffold(
      body: Stack(
        children: [
          const GoogleMap(
            zoomGesturesEnabled: true,
            mapType: MapType.terrain,
            initialCameraPosition:
                CameraPosition(zoom: 17.1, target: currentPosition),
          ),

          /// Positioned widget to align the row at the top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: width * 0.15),

                  /// Pop-up Go online notification
                  FlutterSwitch(
                    inactiveTextFontWeight: FontWeight.w700,
                    activeTextFontWeight: FontWeight.w700,
                    width: 90,
                    height: 40,
                    activeText: 'Online',
                    activeTextColor: TColors.white,
                    inactiveTextColor: TColors.white,
                    activeColor: TColors.primary,
                    inactiveColor: TColors.error,
                    inactiveText: 'Offline',
                    showOnOff: true,
                    valueFontSize: 13,
                    padding: 5,
                    value: status,
                    onToggle: (val) async {
                      setState(() {
                        status = val;
                      });
                      Vibration.vibrate(duration: 50);
                    },
                  ),

                  /// Driver notification
                  MapCustomIcons(
                    myMargin: const EdgeInsets.only(right: 20),
                    containerIcon: Iconsax.notification,
                    scaffoldKey: null,
                    onTap: () {
                      showModalBottomSheet(
                        constraints: BoxConstraints.tight(
                          Size.fromHeight(height * 0.5),
                        ),
                        isScrollControlled: false,
                        context: context,
                        builder: (BuildContext context) {
                          return const HailingBottomSheet();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          /// Bottom sheet section
          DraggableScrollableSheet(
            initialChildSize: 0.41,
            minChildSize: 0.36,
            maxChildSize: 0.5,
            builder: (BuildContext context, scrollController) {
              return Consumer(
                builder: (context, ref, child) {
                  final dashboardState =
                      ref.watch(driverHomeDataNotifierProvider);
                  final location = dashboardState.otherData.driverLocation;
                  final todaysDate = dashboardState.otherData.todaysDate;
                  final earnings = dashboardState.dashboardData.todaysEarnings;
                  final completedRides =
                      dashboardState.dashboardData.completedTrips;
                  final driverRate = dashboardState.dashboardData.driveRate;
                  final acceptanceRate =
                      dashboardState.dashboardData.acceptanceRate;
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TColors.primary.withOpacity(0.8),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: TColors.dragableBottomSheetColor,
                    ),
                    height: height,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          /// slide handle
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 5,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: TColors.grey,
                              ),
                            ),
                          ),

                          /// Top container listing location and ratings
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              color: TColors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  /// Date
                                  FittedBox(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Iconsax.calendar,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          todaysDate,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),

                                  /// Location
                                  FittedBox(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Iconsax.location,
                                          size: 17,
                                          color: TColors.primary,
                                        ),
                                        Text(
                                          location,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),

                                  /// Rating
                                  FittedBox(
                                    child: Row(
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
                                          animationDuration:
                                              const Duration(milliseconds: 500),
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.30,
                            child: Column(
                              children: [
                                /// Driver Price
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: DriverBox(
                                          boxTitle: earnings.toString(),
                                          boxSubTitle: TTexts.driverEarning,
                                          boxIcon: Icons.wallet,
                                          boxOnTap: () {
                                            context.go(
                                                BGRouteNames.driverEarnings);
                                          },
                                          useFittedBox: true,
                                        ),
                                      ),

                                      /// Completed Trips
                                      Expanded(
                                          child: DriverBox(
                                        boxTitle: completedRides.toString(),
                                        boxSubTitle:
                                            TTexts.driverCompletedTripsTitle,
                                        boxIcon: Icons.car_rental,
                                        boxOnTap: () {
                                          context
                                              .go(BGRouteNames.driverEarnings);
                                        },
                                        useFittedBox: true,
                                      )),
                                    ],
                                  ),
                                ),

                                /// Driver Rate
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: DriverBox(
                                          boxTitle: driverRate.toString(),
                                          boxSubTitle:
                                              TTexts.driverDriveRateTitle,
                                          boxIcon: Icons.rate_review,
                                          boxOnTap: () {
                                            context.push(
                                                BGRouteNames.driverEarnings);
                                          },
                                          useFittedBox: false,
                                        ),
                                      ),

                                      /// Driver Acceptance rate
                                      Expanded(
                                        child: DriverBox(
                                          boxTitle: acceptanceRate.toString(),
                                          boxSubTitle:
                                              TTexts.driverAcceptanceRateTitle,
                                          boxIcon: Iconsax.wallet,
                                          boxOnTap: () {
                                            context.push(
                                                BGRouteNames.driverEarnings);
                                          },
                                          useFittedBox: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
