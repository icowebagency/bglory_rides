import 'package:bglory_rides/features/onboarding_rider/riderOnboarding.dart';
import 'package:bglory_rides/features/rider/screens/auth/login/rider_login.dart';
import 'package:bglory_rides/features/rider/screens/auth/signup/rider_signup.dart';
import 'package:bglory_rides/features/rider/screens/home/profile/rider_profile_edit.dart';
import 'package:bglory_rides/features/rider/screens/home/profile/rider_profile_screen.dart';
import 'package:bglory_rides/features/rider/screens/home/profile/saved_places.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/driver_settings.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/payment_and_cards.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/rider_help_and_support.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/rider_safety.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/rider_settings/rider_about_screen.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/rider_settings/rider_app_notification.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/rider_settings/rider_notifications_and_sound.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/rider_settings/rider_sound_screen.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/rider_settings/rider_theme_screen.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/safety_emergency/rider_safety_share_ride_details.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/support/call_screen.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/support/chat_screen.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/support/faq_details_screen.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/support/faqs_screen.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/trip_history.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/trip_history_screens/rider_blank_trip_history.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/trip_history_screens/trip_details_history.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_homescreen.dart';
import 'package:bglory_rides/features/rider/screens/home/rider_homeshell.dart';
import 'package:bglory_rides/features/rider/screens/home/trip/payment_successful.dart';
import 'package:bglory_rides/features/rider/screens/home/trip/rate_driver.dart';
import 'package:bglory_rides/features/rider/screens/home/trip/rider_invoice_screen.dart';
import 'package:bglory_rides/features/rider/screens/home/trip/rider_trip_details.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/confirm_transaction_pin.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/details_screen.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/rider_add_card.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/rider_phone_verification.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/rider_profile_photo_upload.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/transaction_pin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> riderNavKey = GlobalKey<NavigatorState>();

class RiderRouting {
  static final GoRouter router = GoRouter(
    navigatorKey: riderNavKey,
    initialLocation: BGRiderRouteNames.riderHomePageScreen,
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
      GoRoute(
        path: BGRiderRouteNames.riderTransactionPin,
        builder: (context, state) => const TransactionPinScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderConfirmTransactionPinScreen,
        builder: (context, state) => const ConfirmTransactionPinScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderProfileScreen,
        builder: (context, state) => const RiderProfileScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderProfileEditScreen,
        builder: (context, state) => const RiderProfileEditScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderSavedPlacesScreen,
        builder: (context, state) => const SavedPlacesScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderTripDetailsScreen,
        builder: (context, state) => const RiderTripDetailsScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderPaymentSuccessfulScreen,
        builder: (context, state) => const RiderPaymentSuccessfulScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderInvoiceScreen,
        builder: (context, state) => const RiderInvoiceScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderBlankTripHistoryScreen,
        builder: (context, state) => const RiderBlankTripHistoryScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderTripDetailsHistoryScreen,
        builder: (context, state) => const RiderTripDetailsHistoryScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderNotificationsAndSoundScreen,
        builder: (context, state) => const RiderNotificationsAndSoundScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderSoundScreen,
        builder: (context, state) => const RiderSoundScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderAppNotificationsScreen,
        builder: (context, state) => const RiderAppNotificationScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderThemeScreen,
        builder: (context, state) => const RiderThemeScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderAboutScreen,
        builder: (context, state) => const RiderAboutScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderSafetyShareDetailsScreen,
        builder: (context, state) => const RiderSafetyShareTripDetailsScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderChatScreen,
        builder: (context, state) => const RiderChatScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderCallUsScreen,
        builder: (context, state) => const RiderCallUsScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderFaqsScreen,
        builder: (context, state) => const RiderFaqsScreen(),
      ),
      GoRoute(
        path: BGRiderRouteNames.riderFaqDetailScreen,
        builder: (context, state) => const RiderFaqDetailsScreen(),
      ),
      GoRoute(
          path: BGRiderRouteNames.riderRateDriverScreen,
          builder: (context, state) => const RateDriverScreen()),
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: BGRiderRouteNames.riderHomePageScreen,
                builder: (context, state) => const RiderHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(routes: [
            GoRoute(
              path: BGRiderRouteNames.riderTripHistoryScreen,
              builder: (context, state) => const RiderTripHistoryScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: BGRiderRouteNames.riderPaymentAndCardsScreen,
              builder: (context, state) => const PaymentAndCardsScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: BGRiderRouteNames.riderSettingsScreen,
              builder: (context, state) => const RiderSettingsScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: BGRiderRouteNames.riderSafetyScreen,
              builder: (context, state) => const RiderSafetyScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: BGRiderRouteNames.riderHelpAndSupportScreen,
              builder: (context, state) => const RiderHelpAndSupportScreen(),
            ),
          ]),
        ],
        builder: (context, state, navigationShell) => RiderHomeShell(
          navigationShell: navigationShell,
        ),
      ),
    ],
  );
}

class BGRiderRouteNames {
  static const String riderOnboardingScreen = '/rider/onboarding-screen';
  static const String riderHomePageScreen = '/rider/home-screen';
  static const String riderLogin = '/rider/login-screen';
  static const String riderSignup = '/rider/signup-screen';
  static const String riderUserDetails = '/rider/details-screen';
  static const String riderPhoneVerificationScreen =
      '/rider/phone-verification-screen';
  static const String riderProfilePhotoUploadScreen =
      '/rider/phone-profile-upload-screen';
  static const String riderAddCard = '/rider/add-card-screen';
  static const String riderTransactionPin = '/rider/transaction-pin-screen';
  static const String riderConfirmTransactionPinScreen =
      '/rider/confirm-transaction-pin-screen';
  static const String riderHomeScreen = '/rider/home-screen';
  static const String riderTripHistoryScreen = '/rider/trip-history-screen';
  static const String riderPaymentAndCardsScreen =
      '/rider/payment-and-cards-screen';
  static const String riderSafetyScreen = '/rider/safety-screen';
  static const String riderHelpAndSupportScreen =
      '/rider/help-and-support-screen';
  static const String riderSettingsScreen = '/rider/settings-screen';
  static const String riderProfileScreen = '/rider/profile-screen';
  static const String riderProfileEditScreen = '/rider/profile-edit-screen';
  static const String riderSavedPlacesScreen = '/rider/saved-places-screen';
  static const String riderTripDetailsScreen = '/rider/trip-details-screen';
  static const String riderPaymentSuccessfulScreen =
      '/rider/payment-successful-screen';
  static const String riderRateDriverScreen = '/rider/rate-driver-screen';
  static const String riderInvoiceScreen = '/rider/invoice-screen';
  static const String riderBlankTripHistoryScreen =
      '/rider/blank-trip-history-screen';
  static const String riderTripDetailsHistoryScreen =
      '/rider/trip-details-history-screen';
  static const String riderNotificationsAndSoundScreen =
      '/rider/notifications-and-sound-screen';
  static const String riderAppNotificationsScreen =
      '/rider/app-notifications-screen';
  static const String riderSoundScreen = '/rider/sound-screen';
  static const String riderThemeScreen = '/rider/theme-screen';
  static const String riderAboutScreen = '/rider/about-screen';
  static const String riderSafetyShareDetailsScreen =
      '/rider/safety-share-ride-screen';
  static const String riderChatScreen = '/rider/chat-screen';
  static const String riderCallUsScreen = '/rider/call-us-screen';
  static const String riderFaqsScreen = '/rider/faqs-screen';
  static const String riderFaqDetailScreen = '/rider/faqs-detail-screen';
}
