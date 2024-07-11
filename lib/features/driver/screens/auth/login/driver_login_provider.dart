import 'dart:developer';

import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:bglory_rides/utils/secrets/apiConstants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_provider/auth_state.dart';
import '../auth_provider/driver_auth_state_notifer.dart';

final driverLoginStateNotifierProvider =
    StateNotifierProvider.autoDispose<DriverAuthStateNotifer, AuthState>(
  (ref) => DriverLoginAuthStateNotifier(
    driverRepositoryContract: ref.watch(driverRepositoryProvider),
    ref: ref,
  ),
);

class DriverLoginAuthStateNotifier extends DriverAuthStateNotifer {
  DriverLoginAuthStateNotifier(
      {required super.driverRepositoryContract, required super.ref});

  @override
  Future<bool> onAuthAction(
      {required Map<String, String> target, Function(String)? onError}) async {
    assert(target['phone'] != null || target['email'] != null,
        'Either phone or email must be present');


    state = state.copyWith(isLoading: true);

    final result = await driverRepositoryContract.requestOtp(
      target: target,
    );
    state = state.copyWith(isLoading: false);

    if (result is Failure) {
      onError?.call('OTP request failed');
      return false;
    } else {
      return true;
    }
  }
}
