import 'package:json_annotation/json_annotation.dart';

part 'trip.g.dart';


@JsonSerializable()
class Trip {
  @JsonKey(name: 'id')
  final int? id;
  
  @JsonKey(name: 'driver_id')
  final String? driverId;
  
  @JsonKey(name: 'start_location')
  final String? startLocation;
  
  @JsonKey(name: 'end_location')
  final String? endLocation;
  
  @JsonKey(name: 'fare')
  final String? fare;
  
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  Trip({
    this.id,
    this.driverId,
    this.startLocation,
    this.endLocation,
    this.fare,
    this.createdAt,
    this.updatedAt,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);
}
