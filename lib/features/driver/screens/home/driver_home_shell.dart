import 'dart:developer';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:bglory_rides/common/widgets/app_circular_progress_indicator.dart';
import 'package:bglory_rides/features/driver/screens/home/provider/driver_info/driver_info.dart';
import 'package:bglory_rides/features/driver/screens/home/widgets/custom_drawer.dart';
import 'package:bglory_rides/features/driver/screens/home/widgets/map_custom_icon_widget.dart';
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
  // Initial selected drawer item
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _drawerSelectedIndex = index;
      widget.goBranch(index);
      _scaffoldkey.currentState?.closeDrawer();
    });
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    if (widget.navigationShell.currentIndex != 0) {
      _onItemTapped(0);
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    // final String location =
    //     GoRouter.of(context).routeInformationProvider.value.uri.toString();
    // _selectedIndex = _routeIndexMap[location] ?? 0;
    BackButtonInterceptor.add(myInterceptor,
        name: widget.name, context: context);

    if (ref.read(driverInfoProvider).driverData == null) {
      log('DRIVER DATA IS NULL');
      ref.read(driverInfoProvider.notifier).getDriverInfo();
    } else {
      log('DRIVER DATA IS NOT NULL');
    }
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
          widget.navigationShell,
          Positioned(
            top: 0,
            left: 0,
            child: MapCustomIcons(
              onTap: () {
                _scaffoldkey.currentState?.openDrawer();
              },
              containerIcon: Icons.menu_rounded,
              myMargin: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height / 32,
                left: 20,
              ),
              scaffoldKey: _scaffoldkey,
            ),
          ),
          Consumer(builder: (context, ref, child) {
            return Visibility(
              visible: ref.watch(driverInfoProvider).driverData == null,
              child: Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: const AppCircularProgressIndicator(),
                ),
              ),
            );
          })
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
