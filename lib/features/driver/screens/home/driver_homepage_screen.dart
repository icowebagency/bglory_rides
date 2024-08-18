import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:bglory_rides/features/driver/screens/home/widgets/driver_box_widget.dart';
import 'package:bglory_rides/features/driver/screens/home/widgets/map_custom_icon_widget.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import 'hailing/hailing_bottom_sheet.dart';

const LatLng currentPosition = LatLng(25.1193, 55.3773);

class DriverHomePageScreen extends StatefulWidget {
  const DriverHomePageScreen({super.key});

  @override
  State<DriverHomePageScreen> createState() => _DriverHomePageScreenState();
}

class _DriverHomePageScreenState extends State<DriverHomePageScreen> {
// initial rating value
  // Global key to control the scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _currentRating = 2.1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          const GoogleMap(
            zoomGesturesEnabled: true,
            mapType: MapType.terrain,
            initialCameraPosition:
                CameraPosition(zoom: 15.1, target: currentPosition),
          ),

          /// Driver Drawer and Driver Notification.
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 50,
                ),

                /// Pop-up Go online notification
                Container(
                  margin: const EdgeInsets.only(
                    top: 50,
                  ),
                  width: width * 0.30,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    shape: BoxShape.rectangle,
                    color: TColors.buttonPrimaryDeepGreen,
                    boxShadow: [
                      BoxShadow(
                        color:
                            TColors.black.withOpacity(0.1), // Soft shadow color
                        blurRadius: 10, // Softness of the shadow
                        offset: const Offset(0, 5), // Position of the shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: TColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: TColors.black
                                      .withOpacity(0.1), // Soft shadow color
                                  blurRadius: 10, // Softness of the shadow
                                  offset: const Offset(
                                      0, 5), // Position of the shadow
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.check,
                              color: TColors.buttonPrimaryDeepGreen,
                              size: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            TTexts.driverOnlineNotification,
                            style:
                                Theme.of(context).textTheme.titleMedium!.apply(
                                      color: TColors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// Driver notification
                MapCustomIcons(
                  myMargin: const EdgeInsets.only(top: 50, right: 20),
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

          // /// location button
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: Padding(
          //       padding: const EdgeInsets.only(top: 10),
          //       child: MapCustomIcons(
          //         myMargin: const EdgeInsets.only(top: 50, left: 20),
          //         containerIcon: Icons.location_on_outlined,
          //         scaffoldKey: null,
          //         onTap: () {},
          //       )),
          // ),

          /// Driver Map and car icon section
          // Padding(
          //   padding: const EdgeInsets.only(top: 130),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       /// Driver map
          //       // map button
          //       // MapCustomIcons(
          //       //   myMargin: const EdgeInsets.only(top: 50, left: 20),
          //       //   containerIcon: Icons.map_outlined,
          //       //   onTap: () {},
          //       //   scaffoldKey: null,
          //       // ),
          //       // car location button
          //       MapCustomIcons(
          //         myMargin: const EdgeInsets.only(top: 50, right: 20),
          //         containerIcon: Iconsax.car,
          //         onTap: () {
          //
          //         },
          //         scaffoldKey: null,
          //       ),
          //     ],
          //   ),
          // ),
          DraggableScrollableSheet(
            initialChildSize: 0.41,
            minChildSize: 0.36,
            maxChildSize: 0.5,
            builder: (BuildContext context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: TColors.dragableBottomSheetColor,
                ),
                height: height,
                width: width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Iconsax.calendar,
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  TTexts.driverDate,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Iconsax.location, size: 20),
                                const SizedBox(width: 10),
                                Text(
                                  TTexts.driverLocation,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
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
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ],
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
                                      boxTitle: TTexts.driverMoney,
                                      boxSubTitle: TTexts.driverEarning,
                                      boxIcon: Icons.wallet,
                                      boxOnTap: () {
                                        context
                                            .push(BGRouteNames.driverEarnings);
                                      },
                                      useFittedBox: true,
                                    ),
                                  ),

                                  /// Completed Trips
                                  Expanded(
                                      child: DriverBox(
                                    boxTitle: TTexts.driverCompletedTrips,
                                    boxSubTitle:
                                        TTexts.driverCompletedTripsTitle,
                                    boxIcon: Icons.car_rental,
                                    boxOnTap: () {
                                      context.push(BGRouteNames.driverEarnings);
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
                                      boxTitle: TTexts.driverDriveRate,
                                      boxSubTitle: TTexts.driverDriveRateTitle,
                                      boxIcon: Icons.rate_review,
                                      boxOnTap: () {
                                        context
                                            .push(BGRouteNames.driverEarnings);
                                      },
                                      useFittedBox: false,
                                    ),
                                  ),

                                  /// Driver Acceptance rate
                                  Expanded(
                                    child: DriverBox(
                                      boxTitle: TTexts.driverAcceptanceRate,
                                      boxSubTitle:
                                          TTexts.driverAcceptanceRateTitle,
                                      boxIcon: Iconsax.wallet,
                                      boxOnTap: () {
                                        context
                                            .push(BGRouteNames.driverEarnings);
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
          ),
        ],
      ),
    );
  }
}
