import 'dart:developer';

import 'package:bglory_rides/features/driver/screens/auth/auth_provider/driver_auth_state_notifer.dart';

class DriverVerificationStateNotifier extends DriverAuthStateNotifer {
  DriverVerificationStateNotifier(
      {required super.driverRepositoryContract, required super.ref});

  @override
  Future<bool> onAuthAction({required Map<String, String> target}) async {
    log(target.toString());
    return true;
    // driverRepositoryContract.verifyOtp(target: target, otp: otp);
  }
}
