import 'package:bglory_rides/features/driver/data/model/trip/trip.dart';
import 'package:json_annotation/json_annotation.dart';


part 'earning.g.dart';

@JsonSerializable()
class Earning {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'driver_id')
  final String? driverId;

  @JsonKey(name: 'trip_id')
  final String? tripId;

  @JsonKey(name: 'amount')
  final String? amount;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'trip')
  final Trip? trip;

  Earning({
    this.id,
    this.driverId,
    this.tripId,
    this.amount,
    this.createdAt,
    this.updatedAt,
    this.trip,
  });

  factory Earning.fromJson(Map<String, dynamic> json) => _$EarningFromJson(json);

  Map<String, dynamic> toJson() => _$EarningToJson(this);
}
