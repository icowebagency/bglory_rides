import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:bglory_rides/utils/secrets/api_constants.dart';
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

    final result = await driverRepositoryContract.requestLoginOtp(
      target: target,
    );
    state = state.copyWith(isLoading: false);

    final isTest = ref.read(isTestProvider);

    if (result is Failure) {
      onError?.call((result).errorResponse ?? 'Login failed');
      return false;
    } else {
      if (isTest) {
        final data = (result as Success).data;
        dynamic otp = data['data']['otp'];
        NotificationUtil.showSuccessToast(
          '$otp',
          duration: const Duration(seconds: 10),
        );
      }
      return true;
    }
  }
}
