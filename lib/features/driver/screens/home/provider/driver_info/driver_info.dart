import 'package:bglory_rides/features/driver/data/model/driver_response/driver_response.dart';
import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:bglory_rides/utils/secrets/api_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'driver_info.g.dart';
part 'driver_info.freezed.dart';

@Riverpod(keepAlive: true)
class DriverInfo extends _$DriverInfo {
  @override
  DriverInfoState build() => const DriverInfoState();

  void setDriverData(DriverResponse driverData) {
    state = state.copyWith(driverData: driverData);
  }

  void getDriverInfo() async {
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    final result = await ref.read(driverRepositoryProvider).getDriverEarnings();
    if (result is Success) {
      final driverProfile = result.data as DriverResponse;
      setDriverData(driverProfile);
    }
  }
}

@freezed
class DriverInfoState with _$DriverInfoState {
  const factory DriverInfoState({
    DriverResponse? driverData,
  }) = _DriverInfoState;
}
