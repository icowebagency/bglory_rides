import 'dart:developer';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:bglory_rides/features/rider/screens/home/widgets/rider_drawer.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/extensions/router_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/loading_widget.dart';
import '../../../driver/screens/home/widgets/map_custom_icon_widget.dart';

class RiderHomeShell extends ConsumerStatefulWidget {
  const RiderHomeShell({Key? key, required this.navigationShell})
      : super(key: key);

  final StatefulNavigationShell navigationShell;

  final String name = 'RiderHomeShell';

  void goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  ConsumerState<RiderHomeShell> createState() => _RiderHomeShellState();
}

class _RiderHomeShellState extends ConsumerState<RiderHomeShell> {
  int _drawerSelectedIndex = 0;

  // Define the paths that belong to the StatefulShellBranches
  final List<String> _shellRoutes = [
    BGRiderRouteNames.riderTripHistoryScreen, // Adjust these as per your routes
    BGRiderRouteNames.riderPaymentAndCardsScreen,
    BGRiderRouteNames.riderSettingsScreen,
    BGRiderRouteNames.riderSafetyScreen,
    BGRiderRouteNames.riderHelpAndSupportScreen,
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _drawerSelectedIndex = index;
      widget.goBranch(index);
      _scaffoldKey.currentState?.closeDrawer();
    });
  }

  void startRouteListening() {
    RiderRouting.router.backButtonDispatcher;
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    final uri = RiderRouting.router.location;
    log('INTERCEPTOR: $uri');

    if (widget.navigationShell.currentIndex != 0 &&
        _shellRoutes.contains(uri)) {
      // Navigate back to the RiderHome tab if we're not on it
      _onItemTapped(0);
      return true; // Stop default back button behavior
    }
    // Allow default back button behavior otherwise
    return false;
  }

  @override
  void initState() {
    super.initState();

    BackButtonInterceptor.add(myInterceptor,
        name: widget.name, context: context);

    // if (ref.read(riderInfoProvider).riderData == null) {
    //   ref.read(riderInfoProvider.notifier).getRiderInfo();
    // }
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          LoadingWidget(
            //   isLoading: ref.watch(riderInfoProvider).riderData == null,
            child: widget.navigationShell,
          ),
          Positioned(
            left: 0,
            child: SafeArea(
              child: MapCustomIcons(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                containerIcon: Icons.menu_rounded,
                myMargin: const EdgeInsets.only(
                  left: 20,
                ),
                scaffoldKey: _scaffoldKey,
              ),
            ),
          ),
        ],
      ),
      drawer: Builder(builder: (context) {
        return RiderCustomDrawer(
          onItemTapped: _onItemTapped,
          index: _drawerSelectedIndex,
        );
      }),
    );
  }
}
