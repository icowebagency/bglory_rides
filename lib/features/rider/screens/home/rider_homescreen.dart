import 'package:bglory_rides/features/driver/screens/home/hailing/pickup_bottom_sheet.dart';
import 'package:bglory_rides/features/driver/screens/home/provider/home_provider.dart';
import 'package:bglory_rides/features/driver/screens/home/widgets/map_custom_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

const LatLng currentPosition = LatLng(4.873944125830453, 6.968284104088095);

class RiderHomeScreen extends ConsumerStatefulWidget {
  const RiderHomeScreen({super.key});

  @override
  ConsumerState<RiderHomeScreen> createState() => _DriverHomePageScreenState();
}

class _DriverHomePageScreenState extends ConsumerState<RiderHomeScreen> {
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
                          return const PickupBottomSheetScreen();
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
                          horizontal: 20, vertical: 10),
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

                          /// Search field
                          TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Iconsax.search_status,
                                color: TColors.primary,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.close_circle,
                                  color: TColors.grey,
                                ),
                              ),
                              hintText: TTexts.riderSearchHintTitle,
                              hintStyle: Theme.of(context).textTheme.bodySmall,
                              fillColor: TColors.containerBackgroundColor,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: TColors.grey,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: TColors.primary,
                                ),
                              ),
                              filled: true,
                            ),
                          ),

                          /// Recent destination section
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
