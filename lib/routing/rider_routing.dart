import 'package:bglory_rides/features/onboarding_rider/riderOnboarding.dart';
import 'package:bglory_rides/features/rider/screens/auth/login/rider_login.dart';
import 'package:bglory_rides/features/rider/screens/auth/signup/rider_signup.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/details_screen.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/rider_add_card.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/rider_phone_verification.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/rider_profile_photo_upload.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> riderNavKey = GlobalKey<NavigatorState>();

class RiderRouting {
  static final GoRouter router = GoRouter(
    navigatorKey: riderNavKey,
    initialLocation: BGRiderRouteNames.riderAddCard,
    routes: [
      GoRoute(
        path: BGRiderRouteNames.riderOnboardingScreen,
        builder: (context, state) => const RiderOnboardingScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderLogin,
        builder: (context, state) => const RiderLoginScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderSignup,
        builder: (context, state) => const RiderSignup(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderUserDetails,
        builder: (context, state) => const RiderDetailsScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderPhoneVerificationScreen,
        builder: (context, state) => const RiderPhoneVerificationScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderProfilePhotoUploadScreen,
        builder: (context, state) => const RiderProfilePhotoUploadScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderAddCard,
        builder: (context, state) => const RiderAddCardScreen(),
      ),
    ],
  );
}

class BGRiderRouteNames {
  static const String riderOnboardingScreen = '/rider/onboarding-screen';
  static const String riderLogin = '/rider/login-screen';
  static const String riderSignup = '/rider/signup-screen';
  static const String riderUserDetails = '/rider/details-screen';
  static const String riderPhoneVerificationScreen =
      '/rider/phone-verification-screen';
  static const String riderProfilePhotoUploadScreen =
      '/rider/phone-profile-upload-screen';
  static const String riderAddCard = '/rider/add-card-screen';
}
