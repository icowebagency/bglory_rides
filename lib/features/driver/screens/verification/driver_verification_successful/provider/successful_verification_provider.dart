import 'dart:developer';

import 'package:bglory_rides/features/driver/data/model/driver_data/driver_data.dart';
import 'package:bglory_rides/features/driver/data/model/driver_response/driver_response.dart';
import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:bglory_rides/features/driver/screens/home/provider/driver_info/driver_info.dart';
import 'package:bglory_rides/utils/constants/constant_values.dart';
import 'package:bglory_rides/utils/secrets/api_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'successful_verification_provider.g.dart';

@riverpod
class SuccessfulVerificationStateNotifier
    extends _$SuccessfulVerificationStateNotifier {
  @override
  bool build() => false;

  Future<bool?> onProceed({required Function(String message) onError}) async {
    state = true;
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    final result = await ref.read(driverRepositoryProvider).getDriverEarnings();

    if (result is Failure) {
      if (result.errorResponse == ConstantValues.driverProfileNotComplete) {
        return false;
      }
      onError('An Error Occurred');
    } else {
      final successResult = result as Success;
      final driverProfile = successResult.data as DriverResponse;
      ref.read(driverInfoProvider.notifier).setDriverData(driverProfile);
      log('is profile incomplete ${driverProfile.driver?.profileIsIncomplete}');
      return driverProfile.driver?.profileIsIncomplete == null
          ? null
          : !driverProfile.driver!.profileIsIncomplete!;
    }
    return null;
  }
}
