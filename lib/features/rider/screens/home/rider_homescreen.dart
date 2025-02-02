import 'dart:async';

import 'package:bglory_rides/common/google_maps/provider.dart';
import 'package:bglory_rides/features/rider/screens/home/providers/home_provider.dart';
import 'package:bglory_rides/features/rider/screens/home/providers/map_provider.dart';
import 'package:bglory_rides/features/rider/screens/home/providers/search_location_provider.dart';
import 'package:bglory_rides/features/rider/screens/home/widgets/rider_trip_history.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../driver/screens/home/widgets/map_custom_icon_widget.dart';
import 'bottomSheets_screens/confirm_trip_details.dart';
import 'bottomSheets_screens/driver_found.dart';
import 'bottomSheets_screens/driver_onroute.dart';
import 'bottomSheets_screens/get_a_driver.dart';
import 'bottomSheets_screens/start_trip.dart';
import 'bottomSheets_screens/trip_completed.dart';

const LatLng currentPosition = LatLng(37.42796133580664, -122.085749655962);

class RiderHomeScreen extends ConsumerStatefulWidget {
  const RiderHomeScreen({super.key});

  @override
  ConsumerState<RiderHomeScreen> createState() => _DriverHomePageScreenState();
}

class _DriverHomePageScreenState extends ConsumerState<RiderHomeScreen> {
  // Global key to control the scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // A TextEditingController to control the text
  final TextEditingController _controller = TextEditingController();
  
  final DraggableScrollableController _sheetController = DraggableScrollableController();

  // Variables to control the search field visibility and text
  bool isTyping = false;
  String destination = ""; // Holds the value of the destination
  bool isDraggableSheetVisible =
      true; // Flag to control DraggableScrollableSheet
  FocusNode topFieldFocusNode = FocusNode();

  void _showPriceBottomSheet(BuildContext context) {
    // Dismiss the DraggableScrollableSheet and show a new BottomSheet for price options
    setState(() {
      isDraggableSheetVisible = false; // Hide the DraggableScrollableSheet
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    double width = size.width;
    double height = size.height;
    final dark = THelperFunctions.isDarkMode(context);
    final searchState = ref.watch(searchLocationProvider);
    final homeState = ref.watch(homeProvider);
    final mapProvider = ref.watch(userMapProvider);

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            compassEnabled: false,
            zoomControlsEnabled: true,
            myLocationButtonEnabled: true,
            markers: mapProvider.markers,
            polylines: mapProvider.polylines,
            initialCameraPosition: const CameraPosition(
              zoom: 14,
              target: currentPosition,
            ),
            zoomGesturesEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              ref.read(userMapProvider.notifier).initializeMap(controller);
            },
          ),

          // Top search bar that displays the entered destination
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button or any other top icon
                      SizedBox(width: width * 0.15),

                      /// Driver notification
                      MapCustomIcons(
                        myMargin: const EdgeInsets.only(right: 20),
                        containerIcon: Iconsax.notification,
                        scaffoldKey: null,
                        onTap: () {
                          showBottomSheet(
                            // isScrollControlled: false,
                            context: context,
                            // barrierColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return const TripCompletedBottomSheet();
                            },
                          );
                          // context.push(
                          //     BGRiderRouteNames.riderBlankTripHistoryScreen);
                        },
                      ),
                    ],
                  ),

                  // Search bar that shows the entered destination
                  ///TODO: Remove this destination
                  if (destination.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: TColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(Iconsax.search_status,
                                color: TColors.dark),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                destination,
                                // Display the entered destination here
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: TColors.dark),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  // Original search column that becomes visible when typing
                  ///TODO: implement properly
                  // Visibility(
                  //   visible: isTyping,
                  //   child: Padding(
                  //     padding:
                  //         const EdgeInsets.only(top: 20, left: 20, right: 20),
                  //     child: Container(
                  //       color: TColors.white,
                  //
                  //       /// Top search field
                  //       child: TextFormField(
                  //         onChanged: (value) {
                  //           setState(() {
                  //             destination =
                  //                 value; // Update destination while typing.
                  //           });
                  //         },
                  //         controller: _controller,
                  //         decoration: InputDecoration(
                  //           suffixIcon: GestureDetector(
                  //             onTap: () {
                  //               setState(() {
                  //                 isTyping = false;
                  //                 _controller.clear();
                  //               });
                  //             },
                  //             child: const Icon(
                  //               Iconsax.close_circle,
                  //               size: 18,
                  //               color: TColors.dark,
                  //             ),
                  //           ),
                  //           prefixIcon: const Icon(Iconsax.search_status,
                  //               color: TColors.dark),
                  //           labelText: TTexts.riderSearchHintTitle,
                  //           hintText: TTexts.riderSearchHintTitle,
                  //           hintStyle: Theme.of(context)
                  //               .textTheme
                  //               .bodySmall!
                  //               .copyWith(color: TColors.dark),
                  //           focusedBorder: const OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //               color: TColors.primary,
                  //             ),
                  //           ),
                  //           enabledBorder: const OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //               color: TColors.primary,
                  //             ),
                  //           ),
                  //         ),
                  //         // Trigger the BottomSheet and update destination when 'Enter' is pressed
                  //         onFieldSubmitted: (value) {
                  //           setState(() {
                  //             destination =
                  //                 value; // Update the destination with the typed value
                  //             isTyping =
                  //                 false; // Hide the search input once entered
                  //           });
                  //           _showPriceBottomSheet(
                  //               context); // Show the BottomSheet
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

          // Bottom sheet section with DraggableScrollableSheet
          Visibility(
            visible: homeState.isDraggableSheetVisible,
            // Control the visibility of the DraggableScrollable widget
            child: DraggableScrollableSheet(
              initialChildSize: 0.35, // Adjust as needed
              minChildSize: 0.25, // Adjust as needed
              maxChildSize: 0.85, // Maximum size when fully expanded
              controller: _sheetController,
              builder: (BuildContext context, scrollController) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TColors.primary.withOpacity(0.8),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: TColors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            onChanged: (value) {
                              ref.read(searchLocationProvider.notifier).onTextChanged(value);
                              // setState(() {
                              //   destination =
                              //       value; // Updates destination while typing.
                              // });
                            },
                            readOnly: true,
                            onFieldSubmitted: (value) {
                              destination = value;
                              _controller.text = destination;
                            },
                            controller: homeState.source,
                            decoration: InputDecoration(
                              // suffixIcon: GestureDetector(
                              //   onTap: () {
                              //     setState(() {
                              //       isTyping = false;
                              //       // _controller.clear();
                              //     });
                              //   },
                              //   child: const Icon(
                              //     Iconsax.close_circle,
                              //     size: 18,
                              //     color: TColors.dark,
                              //   ),
                              // ),
                              prefixIcon: const Icon(
                                Icons.my_location,
                                size: 18,
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: TColors.primary,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: TColors.primary,
                                ),
                              ),
                              hintText: TTexts.riderSearchHintTitle,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: TColors.dark),
                            ),
                            onTap: () {
                              _sheetController.animateTo(0.75,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                              // setState(() {
                              //   isTyping = true; // Show the search bar
                              // });
                            },
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          Text(
                            TTexts.riderHomeScreenSearchTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),

                          TextFormField(
                            onChanged: (value) {
                              ref.read(searchLocationProvider.notifier).onTextChanged(value);
                              setState(() {
                                destination =
                                    value; // Updates destination while typing.
                              });
                            },
                            onFieldSubmitted: (value) {
                              destination = value;
                              _controller.text = destination;
                            },
                            controller: _controller,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isTyping = false;
                                    _controller.clear();
                                    ref.read(searchLocationProvider.notifier).clearState();
                                  });
                                },
                                child: const Icon(
                                  Iconsax.close_circle,
                                  size: 18,
                                  color: TColors.dark,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: TColors.primary,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: TColors.primary,
                                ),
                              ),
                              labelText: TTexts.riderSearchHintTitle,
                              hintText: TTexts.riderSearchHintTitle,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: TColors.dark),
                            ),
                            onTap: () {
                              // setState(() {
                              //   isTyping = true; // Show the search bar
                              // });
                              _sheetController.animateTo(0.75,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),

                          const SizedBox(height: TSizes.spaceBtwItems),

                          // Scrollable List View for trip history
                          Expanded(
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                children: searchState.predictions.isEmpty ? const [
                                  RiderTripHisotryWidget(
                                    tripTitle: TTexts
                                        .riderHomeScreenRecentDestinationTitleOne,
                                    tripSubTitle: TTexts
                                        .riderHomeScreenRecentDestinationSubTitleOne,
                                  ),
                                  RiderTripHisotryWidget(
                                    tripTitle: TTexts
                                        .riderHomeScreenRecentDestinationTitleTwo,
                                    tripSubTitle: TTexts
                                        .riderHomeScreenRecentDestinationSubTitleTwo,
                                  ),
                                  RiderTripHisotryWidget(
                                    tripTitle: TTexts
                                        .riderHomeScreenRecentDestinationTitleThree,
                                    tripSubTitle: TTexts
                                        .riderHomeScreenRecentDestinationSubTitleThree,
                                  ),
                                ] : [
                                  ...List.generate(searchState.predictions.length, (index) {
                                    final prediction = searchState.predictions[index];
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        _sheetController.animateTo(0.35,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                        ref.read(searchLocationProvider.notifier).clearState();
                                        final prediction = searchState.predictions[index];
                                        _controller.text = prediction.structuredFormatting?.mainText ?? prediction.description;
                                        destination = prediction.structuredFormatting?.mainText ?? prediction.description;
                                        setState(() {});
                                        ref.read(homeProvider.notifier).setDestination(prediction.placeId);
                                      },
                                      child: RiderTripHisotryWidget(
                                        tripTitle: prediction.structuredFormatting?.mainText ?? prediction.description,
                                        tripSubTitle: prediction.structuredFormatting?.secondaryText ?? prediction.description,
                                      ),
                                    );
                                  })
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Searching for driver
          Visibility(
            visible: false,
            child: Container(
              height: height,
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: TColors.dark.withOpacity(0.4),
              child: Center(
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text(
                    TTexts.riderSearchingForDriver,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
