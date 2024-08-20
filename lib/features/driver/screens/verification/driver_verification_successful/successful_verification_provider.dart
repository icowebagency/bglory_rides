import 'dart:developer';

import 'package:bglory_rides/features/driver/data/model/driver_data/driver_data.dart';
import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:bglory_rides/features/driver/data/repository/driver_repository.dart';
import 'package:bglory_rides/utils/constants/constant_values.dart';
import 'package:bglory_rides/utils/secrets/api_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final successfulVerificationStateNotifierProvider =
    StateNotifierProvider<SuccessfulVerificationStateNotifier, bool>(
  (ref) => SuccessfulVerificationStateNotifier(
    ref.watch(driverRepositoryProvider),
  ),
);

class SuccessfulVerificationStateNotifier extends StateNotifier<bool> {
  SuccessfulVerificationStateNotifier(this.driverRepositoryContract)
      : super(false);
  final DriverRepositoryContract driverRepositoryContract;

  Future<bool?> onProceed({required Function(String message) onError}) async {
    state = true;
    final result = await driverRepositoryContract.getDriverEarnings();

    if (result is Failure) {
      if (result.errorResponse == ConstantValues.driverProfileNotComplete) {
        return false;
      }
      onError('An Error Occurred');
    } else {
      final successResult = result as Success;
      final driverProfile = successResult.data as DriverData;
      log('is profile incomplete ${driverProfile.profileIsIncomplete}');
      return  driverProfile.profileIsIncomplete == null ? null : !driverProfile.profileIsIncomplete!;
    }
    return null;
  }
}

enum DriverProfileStatus { complete, incomplete }
