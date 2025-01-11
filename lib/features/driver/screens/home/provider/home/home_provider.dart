import 'package:bglory_rides/features/driver/data/model/driver_dashboard/driver_dashboard_data.dart';
import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/secret/api_constants.dart';

part 'home_provider.freezed.dart';

final driverHomeDataNotifierProvider = NotifierProvider<HomeData, HomeState>(
  () => HomeData(),
);

class HomeData extends Notifier<HomeState> {
  @override
  HomeState build() => HomeState.initial();

  void loadHomePageData() async {
    final result =
        await ref.read(driverRepositoryProvider).getDriverDashboardData();
    if (result is Success) {
      final dashboardData = (result.data as DriverDashboardData);
      state = state.copyWith(dashboardData: dashboardData);
    } else {
      NotificationUtil.showErrorNotification(
          '${(result as Failure).errorResponse}');
    }
  }
}

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required DriverDashboardData dashboardData,
    required OtherDashboardData otherData,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
      dashboardData: DriverDashboardData(
        todaysEarnings: 0,
        averageRating: '0.00',
        completedTrips: 0,
        driveRate: 0,
        acceptanceRate: 0,
      ),
      otherData: OtherDashboardData(
        todaysDate: DateFormat('d, MMMM, yyyy').format(DateTime.now()),
        driverLocation: 'Lagos',
      ));
}

@freezed
class OtherDashboardData with _$OtherDashboardData {
  factory OtherDashboardData({
    required String todaysDate,
    required String driverLocation,
  }) = _OtherDashboardData;
}
