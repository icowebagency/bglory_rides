import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/secret/api_constants.dart';
import '../auth_provider/auth_state.dart';
import '../auth_provider/driver_auth_state_notifer.dart';

final driverSignUpStateNotifierProvider =
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

    final result = await driverRepositoryContract.requestSignUpOtp(
      target: target,
    );
    state = state.copyWith(isLoading: false);

    final isTest = ref.read(isTestProvider);

    if (result is Failure) {
      onError?.call("${(result).message}");

      return false;
    } else {
      if (isTest) {
        final data = (result as Success).data;
        RegExp otpPattern = RegExp(r"OTP is: (\d{6})");
        Match? match = otpPattern.firstMatch(data['message']);
        String otp = match != null ? match.group(1)! : "Not found";
        NotificationUtil.showSuccessToast(
          otp,
          duration: const Duration(seconds: 6),
        );
      }
      return true;
    }
  }
}
