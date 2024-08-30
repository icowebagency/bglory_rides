import 'package:bglory_rides/features/driver/data/model/driver_data/driver_data.dart';
import 'package:bglory_rides/features/driver/data/model/earning/earning.dart';
import 'package:json_annotation/json_annotation.dart';

part 'driver_response.g.dart';

@JsonSerializable(explicitToJson: true)
class DriverResponse {
  @JsonKey(name: 'driver')
  final DriverData? driver;

  @JsonKey(name: 'earnings')
  final List<Earning>? earnings;

  @JsonKey(name: 'balance')
  final String? balance;

  @JsonKey(name: 'completed_rides')
  final int? completedRides;

  @JsonKey(name: 'rejected_rides')
  final int? rejectedRides;

  @JsonKey(name: 'canceled_rides')
  final int? canceledRides;

  @JsonKey(name: 'drive_rate')
  final int? driveRate;

  DriverResponse({
    this.driver,
    this.earnings,
    this.balance,
    this.completedRides,
    this.rejectedRides,
    this.canceledRides,
    this.driveRate,
  });

  factory DriverResponse.fromJson(Map<String, dynamic> json) =>
      _$DriverResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DriverResponseToJson(this);
}
