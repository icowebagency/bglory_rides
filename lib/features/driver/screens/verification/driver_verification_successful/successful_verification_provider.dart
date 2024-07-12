import 'package:bglory_rides/features/driver/data/model/driver_data/driver_data.dart';
import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:bglory_rides/features/driver/data/repository/driver_repository.dart';
import 'package:bglory_rides/utils/secrets/apiConstants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final successfulVerificationStateNotifierProvider = StateNotifierProvider<SuccessfulVerificationStateNotifier, bool>(
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
    final result = await driverRepositoryContract.getDriverProfile();

    if (result is Failure) {
      onError('An Error Occurred');
    } else {
      final successResult = result as Success;
      final driverProfile = successResult.data as DriverData;
      return !driverProfile.profileIsIncomplete;
    }
    return null;
  }
}

enum DriverProfileStatus { complete, incomplete }
