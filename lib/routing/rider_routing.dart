import 'package:bglory_rides/features/onboarding_rider/riderOnboarding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> riderNavKey = GlobalKey<NavigatorState>();

class RiderRouting {
  static final GoRouter router = GoRouter(
    navigatorKey: riderNavKey,
    initialLocation: BGRouteNames.riderOnboardingScreen,
    routes: [
      GoRoute(
        path: BGRouteNames.riderOnboardingScreen,
        builder: (context, state) => const RiderOnboardingScreen(),
      ),
    ],
  );
}

class BGRouteNames {
  static const String riderOnboardingScreen = '/rider/onboarding-screen';
}
