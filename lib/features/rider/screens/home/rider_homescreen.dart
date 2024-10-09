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
import '../../../driver/screens/home/provider/home/home_provider.dart';
import '../../../driver/screens/home/widgets/map_custom_icon_widget.dart';

const LatLng currentPosition = LatLng(4.873944125830453, 6.968284104088095);

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
    ref.read(driverHomeDataNotifierProvider.notifier).loadHomePageData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    double width = size.width;
    double height = size.height;
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Stack(
        children: [
          // Google Map widget
          const GoogleMap(
            zoomGesturesEnabled: true,
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
              zoom: 17.1,
              target: currentPosition,
            ),
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
                          // showModalBottomSheet(
                          //   isScrollControlled: false,
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return const TripCompletedBottomSheet();
                          //   },
                          // );
                          context.push(
                              BGRiderRouteNames.riderBlankTripHistoryScreen);
                        },
                      ),
                    ],
                  ),

                  // Search bar that shows the entered destination
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
                  Visibility(
                    visible: isTyping,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Container(
                        color: TColors.white,

                        /// Top search field
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              destination =
                                  value; // Update destination while typing.
                            });
                          },
                          controller: _controller,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isTyping = false;
                                  _controller.clear();
                                });
                              },
                              child: const Icon(
                                Iconsax.close_circle,
                                size: 18,
                                color: TColors.dark,
                              ),
                            ),
                            prefixIcon: const Icon(Iconsax.search_status,
                                color: TColors.dark),
                            labelText: TTexts.riderSearchHintTitle,
                            hintText: TTexts.riderSearchHintTitle,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: TColors.dark),
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
                          ),
                          // Trigger the BottomSheet and update destination when 'Enter' is pressed
                          onFieldSubmitted: (value) {
                            setState(() {
                              destination =
                                  value; // Update the destination with the typed value
                              isTyping =
                                  false; // Hide the search input once entered
                            });
                            _showPriceBottomSheet(
                                context); // Show the BottomSheet
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom sheet section with DraggableScrollableSheet
          Visibility(
            visible: isDraggableSheetVisible,
            // Control the visibility of the DraggableScrollable widget
            child: DraggableScrollableSheet(
              initialChildSize: 0.35, // Adjust as needed
              minChildSize: 0.12, // Adjust as needed
              maxChildSize: 0.75, // Maximum size when fully expanded
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
                          /// First text field.
                          TextFormField(
                            onChanged: (value) {
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
                              setState(() {
                                isTyping = true; // Show the search bar
                              });
                            },
                          ),

                          const SizedBox(height: TSizes.spaceBtwItems),

                          // Scrollable List View for trip history
                          Expanded(
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: const Column(
                                children: [
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
        ],
      ),
    );
  }
}
