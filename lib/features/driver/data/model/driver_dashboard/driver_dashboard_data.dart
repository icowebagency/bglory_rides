import 'package:bglory_rides/utils/constants/key_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'driver_dashboard_data.g.dart';

@JsonSerializable()
class DriverDashboardData {
  @JsonKey(name: DriverKey.todaysEarnings)
  final int todaysEarnings;

  @JsonKey(name: DriverKey.averageRating)
  final int averageRating;

  @JsonKey(name: DriverKey.completedTrips)
  final int completedTrips;

  @JsonKey(name: DriverKey.driveRate)
  final int driveRate;

  @JsonKey(name: DriverKey.acceptanceRate)
  final int acceptanceRate;

  DriverDashboardData({
    required this.todaysEarnings,
    required this.averageRating,
    required this.completedTrips,
    required this.driveRate,
    required this.acceptanceRate,
  });

  factory DriverDashboardData.fromJson(Map<String, dynamic> json) =>
      _$DriverDashboardDataFromJson(json);

  Map<String, dynamic> toJson() => _$DriverDashboardDataToJson(this);



  
}
