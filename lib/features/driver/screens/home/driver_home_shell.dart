import 'dart:developer';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:bglory_rides/common/widgets/loading_widget.dart';
import 'package:bglory_rides/features/driver/screens/home/provider/driver_info/driver_info.dart';
import 'package:bglory_rides/features/driver/screens/home/widgets/custom_drawer.dart';
import 'package:bglory_rides/features/driver/screens/home/widgets/map_custom_icon_widget.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/extensions/router_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DriverHomeShell extends ConsumerStatefulWidget {
  const DriverHomeShell({Key? key, required this.navigationShell})
      : super(key: key);
  final StatefulNavigationShell navigationShell;

  final String name = 'DriverHomeShell';

  void goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  ConsumerState<DriverHomeShell> createState() => _DriverHomeWrapperState();
}

class _DriverHomeWrapperState extends ConsumerState<DriverHomeShell> {
  int _drawerSelectedIndex = 0;

  // Define the paths that belong to the StatefulShellBranches
  final List<String> _shellRoutes = [
    BGRouteNames.driverHomePageScreen,
    BGRouteNames.driverEarnings,
    BGRouteNames.driverTripHistory,
    BGRouteNames.driverSettings,
    BGRouteNames.driverSafety,
    BGRouteNames.driverHelpAndSupport,
  ];

  // Initial selected drawer item
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _drawerSelectedIndex = index;
      widget.goBranch(index);
      _scaffoldkey.currentState?.closeDrawer();
    });
  }

  void startRouteListening() {
    DriverRouting.router.backButtonDispatcher;
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    final uri = DriverRouting.router.location;
    log('INTERCEPTOR: $uri');

    if (widget.navigationShell.currentIndex != 0 &&
        _shellRoutes.contains(uri)) {
      // Navigate back to the DriverHome tab if we're not on it
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

    if (ref.read(driverInfoProvider).driverData == null) {
      ref.read(driverInfoProvider.notifier).getDriverInfo();
    } else {}
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Stack(
        children: [
          LoadingWidget(
            isLoading: ref.watch(driverInfoProvider).driverData == null,
            child: widget.navigationShell,
          ),
          Positioned(
            left: 0,
            child: SafeArea(
              child: MapCustomIcons(
                onTap: () {
                  _scaffoldkey.currentState?.openDrawer();
                },
                containerIcon: Icons.menu_rounded,
                myMargin: const EdgeInsets.only(
                  left: 20,
                ),
                scaffoldKey: _scaffoldkey,
              ),
            ),
          ),
        ],
      ),
      drawer: Builder(builder: (context) {
        return CustomDrawer(
          onItemTapped: _onItemTapped,
          index: _drawerSelectedIndex,
        );
      }),
    );
  }
}
