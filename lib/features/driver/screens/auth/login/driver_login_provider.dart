import 'dart:developer';

import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_provider/auth_state.dart';
import '../auth_provider/driver_auth_state_notifer.dart';

final driverLoginStateNotifierProvider =
    StateNotifierProvider<DriverAuthStateNotifer, AuthState>(
  (ref) => DriverLoginAuthStateNotifier(
    driverRepositoryContract: ref.watch(driverRepositoryProvider),
    ref: ref,
  ),
);

class DriverLoginAuthStateNotifier extends DriverAuthStateNotifer {
  DriverLoginAuthStateNotifier(
      {required super.driverRepositoryContract, required super.ref});

  @override
  Future<bool> onAuthAction({required Map<String, String> target}) async {
    assert(target['phone'] == null && target['email'] == null);

    log('$target');

    // state = state.copyWith(isLoading: true);

    // final result = await driverRepositoryContract.requestOtp(
    //   target: {
    //     target: state.textFieldController.text,
    //   },
    // );
    // state = state.copyWith(isLoading: false);

    // if (result is Failure) {
    //   log('OTP Generation Failed');
    //   return false;
    // } else {
    //   log('OTP Generated Passed');
    //   return true;
    // }
    return false;
  }
}
