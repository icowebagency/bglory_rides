import 'dart:convert';

import 'package:bglory_rides/features/driver/screens/home/account/drivers_document/document_edit.dart';
import 'package:bglory_rides/features/driver/screens/home/account/payment_details/payment_details.dart';
import 'package:bglory_rides/features/driver/screens/home/account/payment_details/payment_details_edit.dart';
import 'package:bglory_rides/features/driver/screens/home/account/vehicle-documents/vehicle_document_edit.dart';
import 'package:bglory_rides/features/driver/screens/home/account/vehicle-documents/vehicle_documents.dart';
import 'package:bglory_rides/features/driver/screens/home/account/vehicle_information/vehicle_information.dart';
import 'package:bglory_rides/features/driver/screens/home/account/vehicle_information/vehicle_information_edit.dart';
import 'package:bglory_rides/features/driver/screens/home/driver_home_shell.dart';
import 'package:bglory_rides/features/driver/screens/home/driver_homepage_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/hailing/passenger_rating.dart';
import 'package:bglory_rides/features/driver/screens/home/hailing/trip_invoice.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/insight.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/transaction_history.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/withdraw_earnings_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/withdrawal_successful_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/safety.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/safety/share_trip_details_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/settings.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/settings/about_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/settings/app_notification.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/settings/app_settings_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/settings/auto_accept_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/settings/driver_theme_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/settings/notification_and_sound.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/settings/sound_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/support.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/support/call_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/support/call_us_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/support/chat_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/support/faqs_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/trip_history/download_receipt_history_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/trip_history/trip_details_screen.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/trips_history.dart';
import 'package:bglory_rides/features/driver/screens/verification/driver_guildelines_screens/driver_motorcycle_hackney_picture.dart';
import 'package:bglory_rides/features/driver/screens/verification/driver_guildelines_screens/driver_motorcycle_picture_guideline%20copy.dart';
import 'package:bglory_rides/features/driver/screens/verification/driver_guildelines_screens/vehicle_insurance_guidline.dart';
import 'package:bglory_rides/utils/constants/key_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/driver/screens/auth/login/driver_login_screen.dart';
import '../features/driver/screens/auth/signup/signup.dart';
import '../features/driver/screens/home/account/account.dart';
import '../features/driver/screens/home/account/drivers_document/driver_document.dart';
import '../features/driver/screens/home/account/profile/profile.dart';
import '../features/driver/screens/home/account/profile/profile_edit.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/driver_exterior_picture_guidline.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/driver_interior_picture_guideline.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/driver_license_guildline.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/driver_profile_photo_guildline.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/proof_of_ownership_guideline.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/road_worthiness_guideline.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/vehicle_license_guideline.dart';
import '../features/driver/screens/verification/driver_information_registration/driver_infomation_registration.dart';
import '../features/driver/screens/verification/driver_information_registration/driver_option.dart';
import '../features/driver/screens/verification/driver_verification/driver_verification_screen.dart';
import '../features/driver/screens/verification/driver_verification_successful/successful_verification_screen.dart';
import '../features/driver/screens/verification/motocycle_category/driver_motocycle_information.dart';
import '../features/onboarding/onboarding.dart';

final GlobalKey<NavigatorState> driverNavKey = GlobalKey<NavigatorState>();

class DriverRouting {
  static final GoRouter router = GoRouter(
    navigatorKey: driverNavKey,
    initialLocation: BGRouteNames.driverLogin,
    routes: [
      GoRoute(
        path: BGRouteNames.driverLogin,
        builder: (context, state) => const DriverLoginScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverOnboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverSignup,
        builder: (context, state) => const DriverSignup(),
      ),
      GoRoute(
        path: BGRouteNames.driverProfile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverProfileEdit,
        builder: (context, state) => const ProfileEditScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverDocumentEdit,
        builder: (context, state) => const DocumentEditScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverDocumentScreen,
        builder: (context, state) => const DriverDocumentScreen(),
      ),
      GoRoute(
        path: BGRouteNames.vehicleInformation,
        builder: (context, state) => const VehicleInformationScreen(),
      ),
      GoRoute(
        path: BGRouteNames.vehicleInformationEdit,
        builder: (context, state) => VehicleInformationEditScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverInsightScreen,
        builder: (context, state) => const InsightScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverWithdrawSuccessfulScreen,
        builder: (context, state) => const WithdrawalSuccessfulScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverTransactionHistoryScreen,
        builder: (context, state) => const TransactionHistory(),
      ),
      GoRoute(
        path: BGRouteNames.driverTripHistoryDetails,
        builder: (context, state) => const TripDetailsScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverPaymentDetailsScreen,
        builder: (context, state) => const PaymentDetailsScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverPaymentDetailsEditScreen,
        builder: (context, state) => const PaymentDetailsEditScreen(),
      ),
      GoRoute(
        path: BGRouteNames.vehicleDocumentScreen,
        builder: (context, state) => const VehicleDocumentsScreen(),
      ),
      GoRoute(
        path: BGRouteNames.vehicleDocumentEditScreen,
        builder: (context, state) => const VehicleDocumentsEditScreen(),
      ),
      GoRoute(
        path: BGRouteNames.vehicleInsuranceGuidlineScreen,
        builder: (context, state) => const VehicleInsuranceGuidline(),
      ),
      GoRoute(
        path: BGRouteNames.driverAppSettingsScreen,
        builder: (context, state) => const AppSettingsScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverAccountScreen,
        builder: (context, state) => const AccountScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverWithdrawEarningScreen,
        builder: (context, state) => const WithdrawEarningsScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverVerification,
        builder: (context, state) => DriverVerificationScreen(
          target: jsonDecode(state.uri.queryParameters[KeyConstant.target]!),
        ),
      ),
      GoRoute(
        path: BGRouteNames.driverVerificationSuccessful,
        builder: (context, state) => const SuccessfulVerification(),
      ),
      GoRoute(
        path: BGRouteNames.driverOption,
        builder: (context, state) => const DriverOptionScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverUploadInformation,
        builder: (context, state) => const DriverInformationScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverUploadProfile,
        builder: (context, state) => const DriverProfileUploadGuidelineScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverLicenseGuideline,
        builder: (context, state) => const DriverlicenseGuidlineScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverExteriorGuideline,
        builder: (context, state) =>
            const DriverExteriorPictureGuidlineScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverInteriorGuideline,
        builder: (context, state) =>
            const DriverInteriorPictureGuidelineScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverAppNotification,
        builder: (context, state) => const AppNotificationScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverNotificationAndSound,
        builder: (context, state) => const NotificationAndSoundScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverMotorcycleGuideline,
        builder: (context, state) =>
            const DriverMotorcyclePictureGuidelineScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverMotorcycleHackneyPermit,
        builder: (context, state) =>
            const DriverMotorcycleHackneyPermitPictureScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverProofOfOwnership,
        builder: (context, state) =>
            const DriverProofOfOwnershipGuidelineScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverVehicleLicense,
        builder: (context, state) => const DriverVehicleLicenseScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverRoadWorthiness,
        builder: (context, state) => const DriverVehicleRoadWorthinessScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverAutoAccept,
        builder: (context, state) => const AutoAcceptScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverMotorcycleInformation,
        builder: (context, state) => const DriverMotorcycleInformation(),
      ),
      GoRoute(
        path: BGRouteNames.driverSoundScreen,
        builder: (context, state) => const SoundScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverDownloadReceipt,
        builder: (context, state) => const DownloadReceiptScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverThemeScreen,
        builder: (context, state) => const DriverThemeScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverAboutScreen,
        builder: (context, state) => const AboutScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverSafetyShareTripDetailsScreen,
        builder: (context, state) => const SafetyShareTripDetailsScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverChatScreen,
        builder: (context, state) => const ChatScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverCallUsScreen,
        builder: (context, state) => const CallUsScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverFaqsScreen,
        builder: (context, state) => const FaqsScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverTripInvoiceScreen,
        builder: (context, state) => const TripInvoiceScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverPassengerRatingScreen,
        builder: (context, state) => const PassengerRaatingScreen(),
      ),
      GoRoute(
        path: BGRouteNames.driverCallScreen,
        builder: (context, state) => const CallScreen(),
      ),
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: BGRouteNames.driverHomePageScreen,
              builder: (context, state) => const DriverHomePageScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: BGRouteNames.driverEarnings,
              builder: (context, state) => const EarningsScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: BGRouteNames.driverTripHistory,
              builder: (context, state) => const TripHistoryScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: BGRouteNames.driverSettings,
              builder: (context, state) => const SettingsScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: BGRouteNames.driverSafety,
              builder: (context, state) => const SafetyScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: BGRouteNames.driverHelpAndSupport,
              builder: (context, state) => const HelpAndSupportScreen(),
            ),
          ]),
        ],
        builder: (context, state, navigationShell) => DriverHomeShell(
          navigationShell: navigationShell,
        ),
      ),
    
    
    ],
  );
}

class BGRouteNames {
  static const String driverUploadProfile = '/driver/upload-profile';
  static const String driverUploadInformation = '/driver/upload-information';
  static const String driverOption = '/driver/option';
  static const String driverProfile = '/driver/profile-screen';
  static const String driverProfileEdit = '/driver/profile-edit-screen';
  static const String driverPaymentDetailsScreen =
      '/driver/payment-details-screen';
  static const String driverPaymentDetailsEditScreen =
      '/driver/payment-details-edit-screen';
  static const String driverDocumentEdit = '/driver/document-edit-screen';
  static const String vehicleInformation = '/driver/vehicle-information-screen';
  static const String driverInsightScreen = '/driver/insight-screen';
  static const String vehicleInsuranceGuidlineScreen =
      '/driver/vehicle-insurance-guideline-screen';
  static const String driverTransactionHistoryScreen =
      '/driver/transaction-history-screen';
  static const String driverWithdrawEarningScreen =
      '/driver/withdraw-earning-screen';
  static const String vehicleDocumentScreen =
      '/driver/vehicle-documents-screen';
  static const String vehicleDocumentEditScreen =
      '/driver/vehicle-documents-edit-screen';
  static const String vehicleInformationEdit =
      '/driver/vehicle-information-edit-screen';
  static const String driverEarnings = '/driver/earnings-screen';
  static const String driverAutoAccept = '/driver/auto-accept-screen';
  static const String driverNotificationAndSound =
      '/driver/notification-and-sound-screen';
  static const String driverAppNotification = '/driver/app-notification-screen';
  static const String driverSoundScreen = '/driver/driver-sound-screen';
  static const String driverTripHistory = '/driver/trip-history';
  static const String driverSettings = '/driver/settings-screen';
  static const String driverAccountScreen = '/driver/account-screen';
  static const String driverDocumentScreen = '/driver/document-screen';
  static const String driverSafety = '/driver/safety-screen';
  static const String driverTripHistoryDetails = '/driver/trip-details-screen';
  static const String driverHelpAndSupport = '/driver/helpandsupport-screen';
  static const String driverVerificationSuccessful =
      '/driver/verification-successful';
  static const String driverVerification = '/driver/verification';
  static const String driverWithdrawSuccessfulScreen =
      '/driver/withdraw-successful-screen';
  static const String driverProofOfOwnership = '/driver/driver-ownership';
  static const String driverAppSettingsScreen = '/driver/app-screen';
  static const String driverVehicleLicense = '/driver/driver-vehicleLicense';
  static const String driverRoadWorthiness = '/driver/driver-roadWorthiness';

  static const String driverSignup = '/driver/signup';
  static const String driverExteriorGuideline = '/driver/exterior-guideline';
  static const String driverInteriorGuideline = '/driver/interior-guideline';
  static const String driverLicenseGuideline = '/driver/license-guideline';
  static const String driverHomePageScreen = '/driver/driver-homepage';

  static const String driverOnboarding = '/driver/onboarding';
  static const String driverLogin = '/driver/login';
  static const String driverMotorcycleInformation =
      '/driver/motorcycle-information';
  static const String driverMotorcycleGuideline =
      '/driver/motorcycle-guideline';
  static const String driverMotorcycleHackneyPermit =
      '/driver/motorcycle-hackney-permit';
  static const String driverDownloadReceipt = '/driver/download-receipt-screen';
  static const String driverThemeScreen = '/driver/theme-screen';
  static const String driverAboutScreen = '/driver/about-screen';
  static const String driverSafetyShareTripDetailsScreen =
      '/driver/safety-share-trip-details-screen';
  static const String driverChatScreen = '/driver/chat-screen';
  static const String driverCallUsScreen = '/driver/call-us-screen';
  static const String driverFaqsScreen = '/driver/faqs-screen';
  static const String driverTripInvoiceScreen = '/driver/trip-invoice-screen';
  static const String driverPassengerRatingScreen =
      '/driver/passenger-rating-screen';
  static const String driverCallScreen = '/driver/call-screen';
}
