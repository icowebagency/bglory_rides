import 'package:bglory_rides/features/driver/data/model/login_response.dart';
import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:bglory_rides/features/driver/screens/auth/auth_provider/auth_state.dart';
import 'package:bglory_rides/features/driver/screens/auth/auth_provider/driver_auth_state_notifer.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:bglory_rides/utils/secrets/api_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final driverVerificationStateNotifier =
    StateNotifierProvider<DriverVerificationStateNotifier, AuthState>(
  (ref) {
    final repo = ref.watch(driverRepositoryProvider);
    return DriverVerificationStateNotifier(
      driverRepositoryContract: repo,
      ref: ref,
    );
  },
);

class DriverVerificationStateNotifier extends DriverAuthStateNotifer {
  DriverVerificationStateNotifier(
      {required super.driverRepositoryContract, required super.ref});

  Future<bool> onRequestOtp(
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

  @override
  Future<bool> onAuthAction(
      {required Map<String, String> target, Function(String)? onError}) async {
    assert(target['phone'] != null || target['email'] != null,
        'Either phone or email must be present');
    assert(target['otp'] != null, 'otp must be present');

    state = state.copyWith(isLoading: true);

    final result = await driverRepositoryContract.verifyOtp(
      target: target,
      otp: target['otp']!,
    );
    state = state.copyWith(isLoading: false);

    if (result is Failure) {
      onError?.call(result.errorResponse ?? 'OTP Verification Failed');
      return false;
    } else {
      ref.read(userTokenProvider.notifier).state =
          ((result as Success).data as LoginResponse).data.accessToken;

      return true;
    }
  }
}
