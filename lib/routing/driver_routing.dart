import 'package:bglory_rides/features/driver/screens/home/driver_home_shell.dart';
import 'package:go_router/go_router.dart';

import '../features/driver/screens/home/driver_homepage_screen.dart';
import '../features/driver/screens/home/profile/earning_screen.dart';
import '../features/driver/screens/home/profile/profile.dart';
import '../features/driver/screens/home/profile/safety.dart';
import '../features/driver/screens/home/profile/settings.dart';
import '../features/driver/screens/home/profile/support.dart';
import '../features/driver/screens/home/profile/trips_history.dart';
import '../features/driver/screens/login/driver_login_screen.dart';
import '../features/driver/screens/signup/signup.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/driver_exterior_picture_guidline.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/driver_interior_picture_guideline.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/driver_license_guildline.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/driver_profile_photo_guildline.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/proof_of_ownership_guideline.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/road_worthiness_guideline.dart';
import '../features/driver/screens/verification/driver_guildelines_screens/vehicle_license_guideline.dart';
import '../features/driver/screens/verification/driver_information_registration/driver_infomation_registration.dart';
import '../features/driver/screens/verification/driver_information_registration/driver_option.dart';
import '../features/driver/screens/verification/driver_verification_screen.dart';
import '../features/driver/screens/verification/motocycle_category/driver_motocycle_information.dart';
import '../features/driver/screens/verification/successful_verification_screen.dart';
import '../features/onboarding/onboarding.dart';

class DriverRouting {
  static final GoRouter router = GoRouter(
    initialLocation: BGRouteNames.driverHomePageScreen,
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
        path: BGRouteNames.driverVerification,
        builder: (context, state) => DriverVerificationScreen(
          emailInput: state.uri.queryParameters['email'],
          userInput: state.uri.queryParameters['userInput'],
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
        path: BGRouteNames.driverMotorcycleInformation,
        builder: (context, state) => const DriverMotorcycleInformation(),
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
  static const String driverEarnings = '/driver/earnings-screen';
  static const String driverTripHistory = '/driver/trip-history';
  static const String driverSettings = '/driver/settings-screen';
  static const String driverSafety = '/driver/safety-screen';
  static const String driverHelpAndSupport = '/driver/helpandsupport-screen';
  static const String driverVerificationSuccessful =
      '/driver/verification-successful';
  static const String driverVerification = '/driver/verification';
  static const String driverProofOfOwnership = '/driver/driver-ownership';
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
}
