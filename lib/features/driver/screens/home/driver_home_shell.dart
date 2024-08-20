import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:bglory_rides/features/driver/screens/home/widgets/custom_drawer.dart';
import 'package:bglory_rides/features/driver/screens/home/widgets/map_custom_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DriverHomeShell extends StatefulWidget {
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
  State<DriverHomeShell> createState() => _DriverHomeWrapperState();
}

class _DriverHomeWrapperState extends State<DriverHomeShell> {
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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MapCustomIcons(
              onTap: () {
                _scaffoldkey.currentState?.openDrawer();
              },
              containerIcon: Icons.menu_rounded,
              myMargin: const EdgeInsets.only(top: 50, left: 20),
              scaffoldKey: _scaffoldkey,
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
